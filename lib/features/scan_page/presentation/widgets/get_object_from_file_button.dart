import 'dart:async';
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/utils/show_text_snackbar.dart';
import 'package:threedpass/core/widgets/buttons/elevated_button.dart';
import 'package:threedpass/features/hashes_list/bloc/hashes_list_bloc.dart';
import 'package:threedpass/features/hashes_list/domain/entities/snapshot_create_from_file/snapshot_create_from_file.dart';
import 'package:threedpass/features/home_page/bloc/home_context_cubit.dart';
import 'package:threedpass/features/scan_page/presentation/widgets/calc_hash_loading_dialog.dart';
import 'package:threedpass/features/settings_page/bloc/settings_page_cubit.dart';
import 'package:threedpass/router/router.gr.dart';

// TODO refactor. Move logit out of UI
class GetObjectFromFileFloatingButton extends StatelessWidget {
  const GetObjectFromFileFloatingButton({final Key? key}) : super(key: key);

  void showSnackBar(final String text, final BuildContext context) {
    if (Platform.isAndroid) {
      FastSnackBar(textCode: text, context: context).show();
    } // TODO Notify users with CupertinoApp
  }

  void showLoader(final BuildContext context) {
    final homeContext = BlocProvider.of<HomeContextCubit>(context);
    unawaited(
      homeContext.showDialogC((final context) => const CalcHashLoadingWidget()),
    );
  }

  void hideLoader(final BuildContext context) {
    final homeContext = BlocProvider.of<HomeContextCubit>(context);
    homeContext.hideDialogC();
  }

  /// Calc object
  Future<void> createHashFromFile(
    final BuildContext context,
  ) async {
    final snapFactory = SnapshotFileFactory(
      showLoader: () => showLoader(context),
      hashesListBloc: BlocProvider.of<HashesListBloc>(context),
      scanSettings:
          BlocProvider.of<SettingsConfigCubit>(context).state.scanSettings,
    );

    try {
      final pair = await snapFactory.createSnapshotFromFile();
      hideLoader(context);
      unawaited(
        context.router.push(
          PreviewWrapperRoute(
            hashObject: pair.left,
            snapshot: pair.right,
            createNewAnyway: true,
          ),
        ),
      );
    } on FilePickerException catch (e) {
      showSnackBar(e.message, context);
    } on Exception catch (e) {
      hideLoader(context);

      showSnackBar(e.toString(), context);
    }
  }

  @override
  Widget build(final BuildContext context) {
    return Row(
      children: [
        const Spacer(),
        Flexible(
          child: D3pElevatedButton(
            iconData: Icons.folder_open,
            text: 'get_from_file_button_label'.tr(),
            onPressed: () => createHashFromFile(
              context,
            ),
          ),
        ),
      ],
    );
  }
}
