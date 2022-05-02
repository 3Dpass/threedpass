import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:calc/calc.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/common/button_styles.dart';
import 'package:threedpass/common/logger.dart';
import 'package:threedpass/core/utils/formatters.dart';
import 'package:threedpass/features/hashes_list/domain/entities/hash_object.dart';
import 'package:threedpass/features/hashes_list/domain/entities/snapshot.dart';
import 'package:threedpass/features/hashes_list/presentation/bloc/hashes_list_bloc.dart';
import 'package:threedpass/features/result_page/presentation/pages/preview_page.dart';
import 'package:threedpass/features/settings_page/presentation/cubit/settings_page_cubit.dart';
import 'package:threedpass/router/router.dart';

class GetObjectFromFileButton extends StatelessWidget {
  static const allowedExtentions = ['obj', 'stl'];

  const GetObjectFromFileButton({Key? key}) : super(key: key);

  /// Get and validate file
  Future<FilePickerResult?> pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.any,
    );
    if (result != null) {
      final filExtension = result.files.first.extension;
      if (filExtension != null && allowedExtentions.contains(filExtension)) {
        return result;
      }
    }
    return null;
  }

  /// Calc hashes
  Future<String> calcHashes(BuildContext context, String filePath) async {
    final settings =
        BlocProvider.of<SettingsConfigCubit>(context).state.settings;

    return await Calc.start(
      () {
        log('on calc progress');
      },
      filePath,
      settings.gridSize,
      settings.nSections,
    );
  }

  /// Calc object
  Future<void> createHashFromFile(BuildContext context) async {
    final pickerRes = await pickFile();
    if (pickerRes != null) {
      context.router.push(const CalcHashLoadingWidgetRoute());

      final objPath = pickerRes.paths.first!;

      final hashes = await calcHashes(
        context,
        objPath,
      );

      final rawObjName = objPath.split('/').last;

      final snapName = '$rawObjName ${basicDateFormat.format(DateTime.now())}';

      logger.i('Calculated hashes for the object $snapName');

      var hashListState = BlocProvider.of<HashesListBloc>(context).state;
      if (hashListState is HashesListLoaded) {
        final newSnapshot = Snapshot(
          name: snapName,
          hashes: hashes.split('\n'),
          stamp: DateTime.now(),
          externalPathToObj: objPath,
        );

        HashObject? hashObject;
        for (var obj in hashListState.objects) {
          if (newSnapshot.belongsToObject(obj)) {
            hashObject = HashObject(
              localId: obj.localId,
              name: obj.name,
              snapshots: [...obj.snapshots, newSnapshot],
            );
            break;
          }
        }

        if (hashObject != null) {
          logger.i(
            'New snaphost $snapName belongs to the object ${hashObject.name}',
          );
        } else {
          logger.i('Snapshot $snapName is unique');
        }

        context.router.replace(
          PreviewPageWrapperRoute(
            hashObject: hashObject,
            snapshot: newSnapshot,
          ),
        );
      } else {
        logger.w(
          'Hashes list was not initalized when user tried to create new snapshot',
        );

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Hashes list is not initalized :('),
          ),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('File picker error'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: AppButtonStyles.primaryButton,
      icon: const Icon(Icons.folder_open),
      label: const Text('Get from file'),
      onPressed: () => createHashFromFile(context),
    );
  }
}
