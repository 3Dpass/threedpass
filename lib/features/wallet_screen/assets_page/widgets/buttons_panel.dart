import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';
import 'package:threedpass/core/polkawallet/utils/network_state_data_extension.dart';
import 'package:threedpass/core/widgets/buttons/elevated_button.dart';
import 'package:threedpass/core/widgets/other/padding_16.dart';
import 'package:threedpass/features/wallet_screen/assets_page/widgets/coin_transfer_button.dart';
import 'package:threedpass/features/wallet_screen/assets_page/widgets/recieve_button.dart';
import 'package:threedpass/features/wallet_screen/transfer_page/domain/entities/transfer_meta_dto.dart';
import 'package:threedpass/router/router.gr.dart';

class AssetPageButtonsPanel extends StatelessWidget {
  const AssetPageButtonsPanel({super.key});

  static const double height = 50;

  void onPressedSend(final BuildContext context) {
    final appService = BlocProvider.of<AppServiceLoaderCubit>(context).state;

    context.router.push(
      TransferRouteWrapper(
        metadata: CoinsTransferMetaDTO(
          name: appService.networkStateData.tokenSymbol?.first ?? '',
          decimals: appService.networkStateData.safeDecimals,
        ),
      ),
    );
  }

  void onPressedRecieve(final BuildContext context) {
    context.router.push(const RecieveRoute());
  }

  @override
  Widget build(final BuildContext context) {
    return SizedBox(
      height: height,
      child: Padding16(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.max,
          children: [
            Flexible(child: CoinTransferButton(), flex: 2),
            SizedBox(width: 8),
            Flexible(
              child: D3pElevatedButton(
                iconData: Icons.swap_horiz_outlined,
                text: '',
                onPressed: () {},
              ),
              flex: 1,
            ),
            SizedBox(width: 8),
            Flexible(child: RecieveButton(), flex: 1),

            // _SpecialIconButton(
            //   text: 'transfer_coins_button_label',
            //   iconData: Icons.arrow_upward_rounded,
            //   onPressed: () => onPressedSend(context),
            // ),
            // _SpecialIconButton(
            //   text: 'Coming soon',
            //   iconData: Icons.swap_horiz_outlined,
            //   onPressed: () {},
            // ),
            // _SpecialIconButton(
            //   text: 'recieve_coins_button_label',
            //   iconData: Icons.qr_code_2_rounded,
            //   onPressed: () => onPressedRecieve(context),
            // ),
          ],
        ),
      ),
    );
  }
}

/// JUST SOME EXPERIMENTAL DESIGN
// class _SpecialIconButton extends StatelessWidget {
//   final String text;
//   final IconData iconData;
//   final VoidCallback? onPressed;

//   const _SpecialIconButton({
//     required this.text,
//     required this.iconData,
//     required this.onPressed,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         CircleAvatar(
//           backgroundColor: D3pThemeData.mainColor,
//           foregroundColor: Colors.white,
//           child: D3pIconButton(
//             iconData: iconData,
//             onPressed: onPressed,
//             emptyContraints: true,
//             splashRadius: 24,
//           ),
//         ),
//         SizedBox(height: 8),
//         D3pBodyMediumText(text)
//       ],
//     );
//   }
// }
