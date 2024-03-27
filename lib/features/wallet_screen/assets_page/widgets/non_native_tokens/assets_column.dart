import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/widgets/paddings.dart';
import 'package:threedpass/core/widgets/text/d3p_title_large_text.dart';
import 'package:threedpass/features/settings_page/bloc/settings_page_cubit.dart';
import 'package:threedpass/features/wallet_screen/assets_page/widgets/non_native_tokens/assets_card.dart';
import 'package:threedpass/features/wallet_screen/non_native_token_screen/domain/entities/poscan_token_data.dart';

class PoscanAssetsColumn extends StatelessWidget {
  const PoscanAssetsColumn(this.tokens, {super.key});

  final List<PoscanTokenData> tokens;

  @override
  Widget build(final BuildContext context) {
    final settings = BlocProvider.of<SettingsConfigCubit>(context).state;
    final showZeroAssets = settings.appSettings.showZeroAssets;

    final resolvedList =
        <PoscanTokenData>[]; // _TokensToShowList(tokens, showZeroAssets).resolve();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBoxH16(),
          const D3pTitleLargeText('assets_title'),
          Flexible(
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(vertical: 8),
              itemCount: resolvedList.length,
              itemBuilder: (final context, final index) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: AssetsCard(resolvedList[index]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// class _TokensToShowList {
//   final List<TokenBalanceData> initialTokens;
//   final bool showZeroAssets;

//   _TokensToShowList(
//     this.initialTokens,
//     this.showZeroAssets,
//   );

//   List<TokenBalanceData> resolve() {
//     if (showZeroAssets) {
//       return initialTokens;
//     }

//     final res = <TokenBalanceData>[];
//     for (final token in initialTokens) {
//       if (token.isAmountPositive) {
//         res.add(token);
//       }
//     }
//     return res;
//   }
// }
