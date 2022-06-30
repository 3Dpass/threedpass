import 'package:auto_route/auto_route.dart';
import 'package:calc/calc.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/common/button_styles.dart';
import 'package:threedpass/common/logger.dart';
import 'package:threedpass/core/utils/formatters.dart';
import 'package:threedpass/core/utils/hash_file.dart';
import 'package:threedpass/features/hashes_list/domain/entities/hash_object.dart';
import 'package:threedpass/features/hashes_list/domain/entities/snapshot.dart';
import 'package:threedpass/features/hashes_list/presentation/bloc/hashes_list_bloc.dart';
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

  /// Calc object
  Future<void> createHashFromFile(BuildContext context) async {
    // get file
    final pickerRes = await pickFile();
    if (pickerRes != null && pickerRes.files.isNotEmpty) {
      context.router.push(const CalcHashLoadingDialogRoute());
      // file found so create snapshot
      final either = await SnapshotFileFactory.createSnapshotFromFile(
        filePath: pickerRes.files.first.path!,
        settings: BlocProvider.of<SettingsConfigCubit>(context).state.settings,
        context: context,
      );
      context.router.pop();

      // handle result
      either.when(
        left: (err) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Hashes list is not initalized :('),
            ),
          );
        },
        right: (pair) {
          context.router.replace(
            PreviewPageWrapperRoute(
              hashObject: pair.left,
              snapshot: pair.right,
            ),
          );
        },
      );
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
