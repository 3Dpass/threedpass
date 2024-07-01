import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/polkawallet/widgets/account_choose_tile_text.dart';
import 'package:threedpass/core/widgets/text/d3p_body_medium_text.dart';
import 'package:threedpass/features/poscan_assets/bloc/poscan_assets_cubit.dart';
import 'package:threedpass/features/wallet_screen/notifications_page/bloc/notifications_bloc.dart';
import 'package:threedpass/features/wallet_screen/notifications_page/presentation/widgets/fast_notification_tile.dart';
import 'package:threedpass/features/wallet_screen/notifications_page/presentation/widgets/notification_card_basic.dart';
import 'package:threedpass/features/wallet_screen/notifications_page/presentation/widgets/notification_card_body_basic.dart';

class RemoveLiquidityNotificationCard extends StatelessWidget {
  final NotificationRemoveLiquidity notificationDTO;

  const RemoveLiquidityNotificationCard(this.notificationDTO, {super.key});

  @override
  Widget build(final BuildContext context) {
    return NotificationCardBasic(
      message: notificationDTO.message,
      status: notificationDTO.status,
      child: _RemoveLiquidityBody(
        notificationDTO: notificationDTO,
      ),
    );
  }
}

class _RemoveLiquidityBody extends StatelessWidget {
  final NotificationRemoveLiquidity notificationDTO;

  const _RemoveLiquidityBody({required this.notificationDTO});

  @override
  Widget build(final BuildContext context) {
    final assets = BlocProvider.of<PoscanAssetsCubit>(context).state.metadata;

    final asset1Symbols =
        assets[notificationDTO.params.asset1.assetId]?.symbol ?? 'P3D';
    final asset2Symbols =
        assets[notificationDTO.params.asset2.assetId]?.symbol ?? 'P3D';
    return NotificationCardBodyBasic(
      children: [
        const FastNotificationTile(
          iconData: Icons.keyboard_double_arrow_right,
          child: D3pBodyMediumText(
            'assetConversion.removeLiquidity',
            translate: false,
          ),
        ),
        FastNotificationTile(
          iconData: Icons.person,
          child: AccountChooseTileText(
            address: notificationDTO.params.account.address,
            name: notificationDTO.params.account.name,
          ),
        ),
        FastNotificationTile(
          iconData: Icons.swap_horiz,
          child: Flexible(
            child: D3pBodyMediumText(
              '${asset1Symbols}/${asset2Symbols}',
              translate: false,
            ),
          ),
        ),
      ],
    );
  }
}
