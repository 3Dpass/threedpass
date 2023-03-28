part of './non_native_tokens.dart';

class _NonNativeTokensColumn extends StatelessWidget {
  const _NonNativeTokensColumn(this.tokens);

  final List<TokenBalanceData> tokens;

  @override
  Widget build(final BuildContext context) {
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
              itemCount: tokens.length,
              itemBuilder: (final context, final index) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: _NonNativeTokensCard(tokens[index]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
