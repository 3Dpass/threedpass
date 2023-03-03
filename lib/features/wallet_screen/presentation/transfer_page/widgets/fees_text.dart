part of '../transfer_page.dart';

class _FeesText extends StatelessWidget {
  const _FeesText({
    final Key? key,
  }) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    return BlocBuilder<TransferInfoCubit, TransferInfo>(
      builder: (final context, final state) {
        print(state.fees?.partialFee);
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            D3pBodyLargeText('estimated_transfer_fee'.tr()),
            state.fees != null
                ? Text(
                    BalanceUtils.balance(state.fees?.partialFee.toString(), 12),
                  )
                : SizedBox(
                    height: 15,
                    width: 15,
                    child: PlatformCircularProgressIndicator(),
                  ),
          ],
        );
      },
    );
  }
}
