import 'package:calc/calc.dart';
import 'package:file_picker/file_picker.dart';
import 'package:logger/logger.dart';
import 'package:threedpass/core/utils/formatters.dart';
import 'package:threedpass/core/utils/hash_file.dart';
import 'package:threedpass/core/utils/pair.dart';
import 'package:threedpass/core/utils/random_hex.dart';
import 'package:threedpass/features/hashes_list/bloc/hashes_list_bloc.dart';
import 'package:threedpass/features/hashes_list/domain/entities/hash_object.dart';
import 'package:threedpass/features/hashes_list/domain/entities/snapshot.dart';
import 'package:threedpass/features/settings_page/domain/entities/scan_settings.dart';
import 'package:threedpass/setup.dart';

part './file_picker.dart';
part './trans_bytes.dart';

class SnapshotFileFactory {
  final ScanSettings scanSettings;
  final HashesListBloc hashesListBloc;
  final void Function() showLoader;
  // final void Function() hideLoader;

  SnapshotFileFactory({
    required this.scanSettings,
    required this.hashesListBloc,
    required this.showLoader,
    // required this.hideLoader,
  });

  static String snapshotName(final String rawObjName) {
    return '$rawObjName ${Fmt.basicDateFormat.format(DateTime.now())}';
  }

  Future<Pair<HashObject?, Snapshot>> createSnapshotFromFile() async {
    final pickedFile = await _FilePicker().pickFile();

    showLoader();

    final transBytes = await _TransBytes(
      scanSettings: scanSettings,
    ).transBytes();

    final hashes = await calcHashes(
      scanSettings,
      pickedFile,
      transBytes,
    );

    final res = await _createSnapshot(
      filePath: pickedFile,
      settings: scanSettings,
      hashListState: hashesListBloc.state,
      hashes: hashes,
      transBytes: transBytes,
    );

    return res;
  }

  static HashObject? insertSnapIntoHashObject(
    final HashesListLoaded hashListState,
    final Snapshot newSnapshot,
  ) {
    final snapName = newSnapshot.name;

    HashObject? hashObject;
    final index = hashListState.objects
        .indexWhere((final element) => newSnapshot.belongsToObject(element));
    if (index != -1) {
      hashObject = hashListState.objects[index];
    }

    if (hashObject != null) {
      getIt<Logger>().i(
        'New snaphost $snapName belongs to the object ${hashObject.name}',
      );
    } else {
      getIt<Logger>().i('Snapshot $snapName is unique');
    }

    return hashObject;
  }

  Future<Pair<HashObject?, Snapshot>> _createSnapshot({
    required final String filePath,
    required final ScanSettings settings,
    required final HashesListState hashListState,
    required final String hashes,
    required final String transBytes,
  }) async {
    final rawObjName = filePath.split('/').last;
    final snapName = snapshotName(rawObjName);

    if (hashListState is HashesListLoaded) {
      final newSnapshot = Snapshot(
        name: snapName,
        hashes: hashes.split('\n'),
        stamp: DateTime.now(),
        externalPathToObj: filePath,
        settingsConfig: settings.copyWith(
          transBytes: transBytes,
        ),
        fileHash: hashFile(filePath),
      );

      final hashObject = insertSnapIntoHashObject(hashListState, newSnapshot);

      return Pair<HashObject?, Snapshot>(hashObject, newSnapshot);
    } else {
      throw Exception('Hashes list is not initalized :(');
    }
  }

  /// Calc hashes
  static Future<String> calcHashes(
    final ScanSettings settings,
    final String filePath,
    final String transBytes,
  ) async {
    final calculator = Calc2(
      gridSize: settings.gridSize,
      nSections: settings.nSections,
      filePath: filePath,
      transBytes: transBytes,
    );

    return calculator.calcHashes();
  }
}
