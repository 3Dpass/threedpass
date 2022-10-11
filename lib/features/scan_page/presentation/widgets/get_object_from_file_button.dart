import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';
import 'package:threedpass/core/widgets/buttons/elevated_button.dart';
import 'package:threedpass/core/widgets/progress_indicator/thin_progress_indicator.dart';
import 'package:threedpass/features/hashes_list/bloc/hashes_list_bloc.dart';
import 'package:threedpass/features/hashes_list/domain/entities/snapshot_create_from_file/snapshot_create_from_file.dart';
import 'package:threedpass/features/home_page/bloc/home_context_cubit.dart';
import 'package:threedpass/features/scan_page/bloc/object_from_file_cubit.dart';
import 'package:threedpass/features/scan_page/presentation/widgets/calc_hash_loading_dialog.dart';
import 'package:threedpass/features/settings_page/bloc/settings_page_cubit.dart';
import 'package:threedpass/features/settings_page/domain/entities/global_settings.dart';
import 'package:threedpass/router/router.gr.dart';

class GetObjectFromFileFloatingButton extends StatelessWidget {
  const GetObjectFromFileFloatingButton({final Key? key}) : super(key: key);

  void showSnackBar(final String text, final BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(text),
      ),
    );
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
      appServiceLoaderCubit: BlocProvider.of<AppServiceLoaderCubit>(context),
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

  Future<void> Function()? onPressed({
    required final GlobalSettings settingsState,
    required final BuildContext context,
    required final HomeContextCubit homeContext,
    required final bool isBestNumAvaliable,
  }) {
    return _isButtonDisabled(isBestNumAvaliable, settingsState)
        ? null
        : () => createHashFromFile(
              context,
            );
  }

  @override
  Widget build(final BuildContext context) {
    return Row(
      children: [
        const Spacer(),
        Flexible(
          child: Material(
            child: BlocBuilder<SettingsConfigCubit, GlobalSettings>(
              builder: (final context, final settingsState) =>
                  BlocBuilder<BestNumberAvaliableCubit, bool>(
                builder: (final context, final isBestNumAvaliable) {
                  return D3pElevatedButton(
                    icon: _CustomIcon.build(isBestNumAvaliable, settingsState),
                    iconData:
                        _isButtonDisabled(isBestNumAvaliable, settingsState)
                            ? null
                            : Icons.folder_open,
                    text: 'get_from_file_button_label'.tr(),
                    onPressed: onPressed(
                      isBestNumAvaliable: isBestNumAvaliable,
                      settingsState: settingsState,
                      context: context,
                      homeContext: BlocProvider.of<HomeContextCubit>(context),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}

bool _isButtonDisabled(
  final bool isBestNumAvaliable,
  final GlobalSettings settingsState,
) {
  return settingsState.scanSettings.transBytes.isEmpty && !isBestNumAvaliable;
}

class _CustomIcon {
  static Widget? build(
    final bool isBestNumAvaliable,
    final GlobalSettings settingsState,
  ) {
    return _isButtonDisabled(isBestNumAvaliable, settingsState)
        ? const SizedBox(
            height: 20,
            width: 20,
            child: ThinProgressIndicator(),
          )
        : null;
  }
}
