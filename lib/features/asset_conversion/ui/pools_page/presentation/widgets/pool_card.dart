import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';
import 'package:threedpass/core/theme/d3p_colors.dart';
import 'package:threedpass/core/theme/d3p_special_styles.dart';
import 'package:threedpass/core/widgets/buttons/elevated_button.dart';
import 'package:threedpass/core/widgets/buttons/secondary_button.dart';
import 'package:threedpass/core/widgets/d3p_card.dart';
import 'package:threedpass/core/widgets/paddings.dart';
import 'package:threedpass/features/asset_conversion/domain/entities/pool_full_info.dart';

class PoolCard extends StatelessWidget {
  const PoolCard(this.poolFullInfo, {super.key});

  final PoolFullInfo poolFullInfo;

  @override
  Widget build(final BuildContext context) {
    final appService = BlocProvider.of<AppServiceLoaderCubit>(context).state;
    final defaultDecimals = appService.networkStateData.tokenDecimals!.first;
    // print('default decimals $defaultDecimals');

    final asset1Balance = poolFullInfo.realBalance1(defaultDecimals);
    // print(asset1Balance);
    final asset2Balance = poolFullInfo.realBalance2(defaultDecimals);
    // print(asset2Balance);

    const String nativeSymbol = 'P3D';

    final String symbols1 = poolFullInfo.asset1Meta?.symbol ?? nativeSymbol;
    final String symbols2 = poolFullInfo.asset2Meta?.symbol ?? nativeSymbol;

    return D3pCard(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text.rich(
              TextSpan(
                children: [
                  // WidgetSpan(
                  //   child: _IconsRow(),
                  // ),
                  // WidgetSpan(
                  //   child: SizedBox(width: 8),
                  // ),
                  TextSpan(
                    text:
                        '${poolFullInfo.asset1Meta?.symbol ?? 'P3D'} / ${poolFullInfo.asset2Meta?.symbol ?? 'P3D'}',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ],
              ),
              maxLines: 2,
            ),
            const SizedBoxH16(),
            Text(
              'Total locked coins:',
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: Colors.grey),
            ),
            const SizedBoxH4(),
            _LockedCoin(
              balance: asset1Balance,
              symbol: symbols1,
            ),
            _LockedCoin(
              balance: asset2Balance,
              symbol: symbols2,
            ),
            const SizedBoxH8(),
            _LPTokens(poolFullInfo.lpBalance?.balanceBigInt),
            const SizedBoxH16(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Flexible(
                  child: D3pElevatedButton(
                    text: 'deposit_button_label'.tr(),
                    onPressed: () {},
                  ),
                ),
                const SizedBox(width: 16),
                Flexible(
                  child: D3pSecondaryButton(
                    localizedTextKey: 'withdraw_button_label',
                    onPressed: poolFullInfo.lpBalance?.rawBalance == null
                        ? null
                        : () {},
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// class _IconsRow extends StatelessWidget {
//   @override
//   Widget build(final BuildContext context) {
//     return SizedBox(
//       height: 24,
//       width: 44,
//       child: Stack(
//         children: [
//           Align(
//             alignment: Alignment.centerLeft,
//             child: Container(
//               height: 24,
//               width: 24,
//               color: Colors.red,
//             ),
//           ),
//           Align(
//             alignment: Alignment.centerRight,
//             child: Container(
//               height: 24,
//               width: 24,
//               color: Colors.blue,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

class _LockedCoin extends StatelessWidget {
  final String balance;
  final String symbol;

  const _LockedCoin({
    required this.balance,
    required this.symbol,
  });

  @override
  Widget build(final BuildContext context) {
    final medium = Theme.of(context).customTextStyles.d3pBodyMedium;

    return Text.rich(
      TextSpan(
        text: balance + ' ',
        style: medium,
        children: [
          TextSpan(
            text: symbol,
            style: medium.copyWith(color: D3pColors.disabled),
          ),
        ],
      ),
    );
  }
}

class _LPTokens extends StatelessWidget {
  final BigInt? balance;

  const _LPTokens(this.balance);

  @override
  Widget build(final BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: 'LP Tokens: ',
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Colors.grey,
                ),
          ),
          TextSpan(
            text: balance?.toString() ?? '0',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
