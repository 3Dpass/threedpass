import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:async/async.dart';
import 'package:convert/convert.dart';
import 'package:rust_lzss/rust_lzss.dart';
import 'package:threedpass/core/utils/formatters.dart';
import 'package:threedpass/core/utils/hash_file.dart';
import 'package:threedpass/core/utils/logger.dart';
import 'package:threedpass/core/utils/random_hex.dart';
import 'package:threedpass/features/hashes_list/bloc/hashes_list_bloc.dart';
import 'package:threedpass/features/hashes_list/domain/entities/hash_object.dart';
import 'package:threedpass/features/hashes_list/domain/entities/snapshot.dart';
import 'package:threedpass/features/scan_page/bloc/scan_isolate_cubit.dart';
import 'package:threedpass/features/settings_page/domain/entities/algorithm.dart';
import 'package:threedpass/features/settings_page/domain/entities/scan_settings.dart';

part './trans_bytes.dart';

class SnapshotFileFactory {
  final ScanSettings scanSettings;
  final HashesListBloc hashesListBloc;
  // final void Function() showLoader;
  // final ObjectsDirectory objectsDirectory;
  final ScanIsolateCubit scanIsolateCubit;
  // final void Function() hideLoader;

  SnapshotFileFactory({
    required this.scanSettings,
    required this.hashesListBloc,
    // required this.showLoader,
    // required this.objectsDirectory,
    required this.scanIsolateCubit,
    // required this.hideLoader,
  });

  static String snapshotName(final String rawObjName) {
    return '$rawObjName ${Formatters.basicDateFormat.format(DateTime.now())}';
  }

  Future<(HashObject?, Snapshot)> createSnapshotFromFile({
    required final String pickedFilePath,
    required final String relativePath,
  }) async {
    final transBytes = await _TransBytes(
      scanSettings: scanSettings,
    ).calc();

    final hashes = await calcHashes(
      scanSettings,
      pickedFilePath,
      transBytes,
    );

    logger.i('Got hashes: $hashes');
    if (hashes == ScanIsolateCubit.cancelMsg) {
      throw Exception(ScanIsolateCubit.cancelMsg);
    }

    final res = await _createSnapshot(
      filePath: pickedFilePath,
      settings: scanSettings,
      relativePath: relativePath,
      hashListState: hashesListBloc.state,
      hashes: hashes,
      transBytes: transBytes,
    );

    return res;
  }

  static HashObject? insertSnapIntoHashObject(
    final HashesListState hashListState,
    final Snapshot newSnapshot,
  ) {
    final snapName = newSnapshot.name;

    HashObject? hashObject;
    final index = hashListState.value!.objects
        .indexWhere((final element) => newSnapshot.belongsToObject(element));
    if (index != -1) {
      hashObject = hashListState.value!.objects[index];
    }

    if (hashObject != null) {
      logger.i(
        'New snaphost $snapName belongs to the object ${hashObject.name}',
      );
    } else {
      logger.i('Snapshot $snapName is unique');
    }

    return hashObject;
  }

  Future<(HashObject?, Snapshot)> _createSnapshot({
    required final String filePath,
    required final ScanSettings settings,
    required final HashesListState hashListState,
    required final String hashes,
    required final String transBytes,
    required final String relativePath,
  }) async {
    final rawObjName = filePath.split('/').last;

    final snapName = snapshotName(rawObjName);

    Snapshot newSnapshot = Snapshot(
      name: '1 $snapName',
      hashes: hashes.split('\n'),
      stamp: DateTime.now(),
      relativePath: relativePath,
      settingsConfig: settings.copyWith(
        transBytes: transBytes,
      ),
      fileHash: hashFile(filePath),
      isNew: true,
    );

    final hashObject = insertSnapIntoHashObject(hashListState, newSnapshot);

    if (hashObject != null) {
      final i = hashObject.snapshots.length;
      newSnapshot = newSnapshot.copyWith(name: '${i + 1} $snapName');
    }

    return (hashObject, newSnapshot);
  }

  /// Calc hashes
  Future<String> calcHashes(
    final ScanSettings settings,
    final String filePath,
    final String transBytes,
  ) async {
    final op = CancelableOperation<List<String>>.fromFuture(
      getHashes(settings, filePath, transBytes),
      onCancel: () => scanIsolateCubit.setNull(),
    );
    scanIsolateCubit.setData(op);

    final resList = await op.value;
    return resList.join('\n');
  }

  Future<List<String>> getHashes(
    final ScanSettings settings,
    final String filePath,
    final String transBytes,
  ) async {
    final algo = AlgorithmMaster.mapToRust[settings.algorithm]!;
    final transBytesIntList = hex.decode(transBytes); // TODO check if correct
    final transBytesUint8List = Uint8List.fromList(transBytesIntList);

    logger.i(
      "Scan\n  file: $filePath\n  transBytes: $transBytes\n$transBytesIntList  gridSize: ${settings.gridSize}\n  nSections:${settings.nSections}\n  algorithm: $algo",
    );

    final File f = File(filePath);
    final content = f.readAsBytesSync();

    return calc(
      input: content,
      algoRaw: algo,
      par1: settings.gridSize,
      par2: settings.nSections,
      trans: settings.transBytesMode == TransBytesMode.none
          ? null
          : U8Array4(transBytesUint8List),
    );
  }
}
