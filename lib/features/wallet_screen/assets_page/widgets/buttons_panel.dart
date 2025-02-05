import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';
import 'package:threedpass/core/polkawallet/utils/network_state_data_extension.dart';
import 'package:threedpass/core/theme/d3p_theme.dart';
import 'package:threedpass/core/widgets/other/padding_16.dart';
import 'package:threedpass/core/widgets/paddings.dart';
import 'package:threedpass/features/wallet_screen/assets_page/widgets/coin_transfer_button.dart';
import 'package:threedpass/features/wallet_screen/assets_page/widgets/recieve_button.dart';
import 'package:threedpass/features/wallet_screen/assets_page/widgets/swap_button.dart';
import 'package:threedpass/features/wallet_screen/open_pools/open_pools_button.dart';
import 'package:threedpass/features/wallet_screen/transfer_page/domain/entities/transfer_meta_dto.dart';
import 'package:threedpass/router/router.gr.dart';

class AssetPageButtonsPanel extends StatelessWidget {
  const AssetPageButtonsPanel({super.key});

  static const double height =
      D3pThemeData.buttonHeight + 8 + D3pThemeData.buttonHeight;

  Future<void> onPressedSend(final BuildContext context) async {
    final appService = BlocProvider.of<AppServiceLoaderCubit>(context).state;

    await context.router.push(
      TransferRouteWrapper(
        metadata: CoinsTransferMetaDTO(
          name: appService.networkStateData.tokenSymbol?.first ?? '',
          decimals: appService.networkStateData.safeDecimals,
        ),
      ),
    );
  }

  Future<void> onPressedRecieve(final BuildContext context) async {
    await context.router.push(const RecieveRoute());
  }

  @override
  Widget build(final BuildContext context) {
    return SizedBox(
      height: height,
      child: Padding16(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.max,
              children: [
                Flexible(flex: 2, child: CoinTransferButton()),
                SizedBox(width: 8),
                Flexible(
                  flex: 1,
                  child: SwapButton(),
                ),
                SizedBox(width: 8),
                Flexible(flex: 1, child: RecieveButton()),
              ],
            ),
            H8(),
            Row(
              children: [
                Flexible(
                  child: OpenPoolsButton(),
                ),
                Flexible(
                  child: TextButton(
                    onPressed: () =>
                        context.router.push(CreateSwapRouteWapper()),
                    child: Text(
                      'DEBUG ATOMIC SWAP',
                    ),
                  ),
                ),
                // Flexible(
                //   child: SwapButton(),
                // ),
                // Flexible(
                //   child: SwapButton(),
                // ),
              ],
            ),
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
