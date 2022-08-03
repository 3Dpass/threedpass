import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/features/hashes_list/domain/entities/snapshot.dart';
import 'package:threedpass/features/scan_page/presentation/widgets/calc_hash_loading_dialog.dart';
import 'package:threedpass/features/scan_page/router/calc_hash_loading_widget_route.dart';
import 'package:threedpass/features/settings_page/bloc/settings_page_cubit.dart';
import 'package:threedpass/router/router.gr.dart';

class GetObjectFromFileFloatingButton extends StatelessWidget {
  static const allowedExtentions = ['obj', 'stl'];

  const GetObjectFromFileFloatingButton({Key? key}) : super(key: key);

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
    final closeDialogNotifier = ValueNotifier<bool>(false);
    // get file
    final pickerRes = await pickFile();
    if (pickerRes != null && pickerRes.files.isNotEmpty) {
      context.router.push(
        CalcHashLoadingDialogRoute(closeNotification: closeDialogNotifier),
      );
      // file found so create snapshot
      final either = await SnapshotFileFactory.createSnapshotFromFile(
        filePath: pickerRes.files.first.path!,
        settings: BlocProvider.of<SettingsConfigCubit>(context).state.settings,
        context: context,
      );

      closeDialogNotifier.value = true;

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
          context.router.push(
            PreviewWrapperRoute(
              hashObject: pair.left,
              snapshot: pair.right,
              createNewAnyway: true,
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
    return FloatingActionButton.extended(
      // style: AppButtonStyles.primaryButton,
      icon: const Icon(Icons.folder_open),
      label: Text('get_from_file_button_label'.tr()),
      onPressed: () => createHashFromFile(context),
    );
  }
}
