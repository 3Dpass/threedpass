import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/features/hashes_list/domain/entities/snapshot.dart';
import 'package:threedpass/features/home_page/bloc/home_context_cubit.dart';
import 'package:threedpass/features/scan_page/presentation/widgets/calc_hash_loading_dialog.dart';
import 'package:threedpass/features/settings_page/bloc/settings_page_cubit.dart';
import 'package:threedpass/features/settings_page/domain/entities/scan_settings.dart';
import 'package:threedpass/router/router.gr.dart';
import 'package:threedpass/setup.dart';

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

  void showSnackBar(String text, BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(text),
      ),
    );
  }

  /// Calc object
  Future<void> createHashFromFile(
    BuildContext context,
    ScanSettings settings,
    HomeContextCubit homeContext,
  ) async {
    // get file
    final pickerRes = await pickFile();
    if (pickerRes != null && pickerRes.files.isNotEmpty) {
      homeContext.showDialogC((context) => const CalcHashLoadingWidget());

      // file found so create snapshot
      final either = await SnapshotFileFactory.createSnapshotFromFile(
        filePath: pickerRes.files.first.path!,
        settings: settings,
        context: context,
      );

      homeContext.hideDialogC();

      // handle result
      either.when(
        left: (err) {
          showSnackBar('error_hash_list_bloc'.tr(), context);
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
      showSnackBar('error_file_picker'.tr(), context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      // style: AppButtonStyles.primaryButton,
      icon: const Icon(Icons.folder_open),
      label: Text('get_from_file_button_label'.tr()),
      onPressed: () => createHashFromFile(
        context,
        getIt<SettingsConfigCubit>().state.settings,
        BlocProvider.of<HomeContextCubit>(context),
      ),
    );
  }
}
