part of './non_native_tokens.dart';

class _AssetsCard extends StatelessWidget {
  const _AssetsCard(this.data);

  final TokenBalanceData data;

  void onCardClick(final BuildContext context) {
    final address = BlocProvider.of<AppServiceLoaderCubit>(context)
        .state
        .keyring
        .current
        .address!;
    context.router.push(
      NonNativeTokenRoute(
        params: GetExtrinsicsUseCaseParams(
          address: address,
          tokenBalanceData: data,
        ),
      ),
    );
  }

  @override
  Widget build(final BuildContext context) {
    return D3pCard(
      child: InkWell(
        onTap: () => onCardClick(context),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                flex: 4,
                child: D3pBodyMediumText(
                  data.fullName ?? '',
                  translate: false,
                ),
              ),
              Flexible(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    D3pBodyMediumText(
                      data.amount ?? '0',
                      translate: false,
                    ),
                    const SizedBox(width: 8),
                    D3pBodyMediumText(
                      data.symbol ?? '',
                      translate: false,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
