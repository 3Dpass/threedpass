import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:threedpass/core/polkawallet/app_service.dart';
import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';
import 'package:threedpass/core/theme/d3p_special_colors.dart';
import 'package:threedpass/features/preview_page/bloc/outer_context_cubit.dart';
import 'package:threedpass/features/wallet_screen/presentation/assets_page/remove_account_dialog.dart';

class AccountActions extends StatelessWidget {
  const AccountActions({final Key? key}) : super(key: key);

  Future<void> onSelected(final int? value, final BuildContext context) async {
    final outerContext = BlocProvider.of<OuterContextCubit>(context).state;
    switch (value) {
      case 1:
        await showPlatformDialog<void>(
          context: outerContext,
          builder: (final _) => const RemoveAccountDialog(),
        );
        break;
    }
  }

  @override
  Widget build(final BuildContext context) {
    return BlocBuilder<AppServiceLoaderCubit, AppService>(
      builder: (final context, final state) {
        return PlatformPopupMenu(
          icon: Icon(
            Icons.more_horiz_outlined,
            color: Theme.of(context).customColors.appBarButton,
          ),
          options: [
            PopupMenuOption(
              label: 'remove_account_button_label'.tr(),
              onTap: (final _) => onSelected(1, context),
              cupertino: (final _, final __) => CupertinoPopupMenuOptionData(
                isDestructiveAction: true,
              ),
            ),
          ],
        );
      },
    );
  }
}

// class _RemoveAccountMenuItem extends PopupMenuItem<int> {
//   _RemoveAccountMenuItem({required final AppService appService})
//       : super(
//           enabled: appService.status == AppServiceInitStatus.connected,
//           value: 1,
//           child: Text('remove_account_button_label'.tr()),
//         );
// }
