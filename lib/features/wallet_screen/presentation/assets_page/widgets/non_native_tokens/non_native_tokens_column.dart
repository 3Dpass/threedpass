part of './non_native_tokens.dart';

class _NonNativeTokensColumn extends StatelessWidget {
  const _NonNativeTokensColumn(this.tokens);

  final List<TokenBalanceData> tokens;

  @override
  Widget build(final BuildContext context) {
    final settings = BlocProvider.of<SettingsConfigCubit>(context).state;
    final showZeroAssets = settings.appSettings.showZeroAssets!;

    final resolvedList = _TokensToShowList(tokens, showZeroAssets).resolve();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBoxH36(),
          Text(
            'assets_title'.tr(),
            style: Theme.of(context).customTextStyles.d3ptitleLarge,
          ),
          Flexible(
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(vertical: 8),
              itemCount: resolvedList.length,
              itemBuilder: (final context, final index) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: _NonNativeTokensCard(resolvedList[index]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _TokensToShowList {
  final List<TokenBalanceData> initialTokens;
  final bool showZeroAssets;

  _TokensToShowList(
    this.initialTokens,
    this.showZeroAssets,
  );

  List<TokenBalanceData> resolve() {
    if (showZeroAssets) {
      return initialTokens;
    }

    final res = <TokenBalanceData>[];
    for (final token in initialTokens) {
      if (token.amountIsPositive) {
        res.add(token);
      }
    }
    return res;
  }
}
