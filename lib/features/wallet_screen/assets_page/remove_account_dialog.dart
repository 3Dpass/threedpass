import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';
import 'package:threedpass/core/theme/d3p_special_colors.dart';
import 'package:threedpass/core/utils/formatters.dart';
import 'package:threedpass/core/widgets/buttons/text_button.dart';
import 'package:threedpass/core/widgets/dialog/d3p_platform_dialog.dart';
import 'package:threedpass/core/widgets/text/d3p_body_medium_text.dart';

@RoutePage()
class RemoveAccountDialog extends StatelessWidget {
  const RemoveAccountDialog({final Key? key}) : super(key: key);

  Future<void> deleteAccount(
    final AppServiceLoaderCubit appServiceLoaderCubit,
    final BuildContext context,
  ) async {
    final appService = appServiceLoaderCubit.state;

    // remove current account
    await appService.plugin.sdk.api.keyring.deleteAccount(
      appService.keyring,
      appService.keyring.current,
    );

    if (appService.keyring.allAccounts.isNotEmpty) {
      await appServiceLoaderCubit.changeAccount(appService.keyring.current);
    } else {
      appServiceLoaderCubit.justEmit();
    }

    // change account and notify the UI

    // // subscribe to balance
    // AppServiceLoaderCubit.subscribeToBalance(appService);

    // Maybe we should load some cache? Idk. This is copied from the original code.
    // And it may be helpful in the future in case of bugs.
    // appService.store.assets.loadCache(
    //     widget.service.keyring.current,
    //     widget.service.plugin.basic.name);

    Navigator.of(context).pop();
  }

  @override
  Widget build(final BuildContext context) {
    final appServiceLoaderCubit =
        BlocProvider.of<AppServiceLoaderCubit>(context);
    final appService = appServiceLoaderCubit.state;
    final customColors = Theme.of(context).customColors;

    return D3pPlatformDialog(
      title: 'remove_accout_dialog_title'.tr(
        args: [
          Fmt.shorterAddress(appService.keyring.current.address),
        ],
      ),
      content: const D3pBodyMediumText('remove_accout_dialog_text'),
      actions: [
        D3pTextButton(
          onPressed: () => Navigator.of(context).pop(),
          text: 'Cancel'.tr(),
        ),
        D3pTextButton(
          onPressed: () => deleteAccount(appServiceLoaderCubit, context),
          text: 'Delete'.tr(),
          textColor: customColors.dangerColor,
        ),
      ],
    );
  }
}
