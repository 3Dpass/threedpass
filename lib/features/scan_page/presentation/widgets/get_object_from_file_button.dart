import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/polkawallet/app_service.dart';
import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';
import 'package:threedpass/features/hashes_list/domain/entities/snapshot.dart';
import 'package:threedpass/features/home_page/bloc/home_context_cubit.dart';
import 'package:threedpass/features/scan_page/presentation/widgets/calc_hash_loading_dialog.dart';
import 'package:threedpass/features/settings_page/bloc/settings_page_cubit.dart';
import 'package:threedpass/features/settings_page/domain/entities/scan_settings.dart';
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

  void showSnackBar(String text, BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(text),
      ),
    );
  }

  static getTransBytes(BuildContext context) async {
    final String userTransBytes = BlocProvider.of<SettingsConfigCubit>(context)
        .state
        .scanSettings
        .transBytes;

    if (userTransBytes.isNotEmpty) {
      return userTransBytes;
    }

    final AppService appService =
        BlocProvider.of<AppServiceLoaderCubit>(context).state;
    final String bestnumber = appService.bestNumber.value;
    if (bestnumber.isNotEmpty) {
      final blockHash = await appService.plugin.sdk.api.service.webView!
          .evalJavascript('api.rpc.chain.getBlockHash($bestnumber)');

      // final signedBlock = await appService.plugin.sdk.api.service.webView!
      //     .evalJavascript('api.rpc.chain.getBlock()');
      return (blockHash as String)
          .substring(blockHash.length - 8, blockHash.length);
    }

    throw 'Both userTransBytes and bestnumber are empty';
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

      late final String transBytes;
      try {
        transBytes = await getTransBytes(context);
      } catch (e) {
        homeContext.hideDialogC();
        showSnackBar('error_trans_bytes_unavaliable'.tr(), context);
        return;
      }

      // file found so create snapshot
      final either = await SnapshotFileFactory.createSnapshotFromFile(
        filePath: pickerRes.files.first.path!,
        settings: settings,
        context: context,
        transBytes: transBytes,
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
        BlocProvider.of<SettingsConfigCubit>(context).state.scanSettings,
        BlocProvider.of<HomeContextCubit>(context),
      ),
    );
  }
}
