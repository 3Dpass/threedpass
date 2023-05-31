part of '../transfer_page.dart';

class _MakeTransferButton extends StatelessWidget {
  const _MakeTransferButton({
    required this.formKey,
    required this.amountController,
    required this.passwordController,
    required this.toAddressController,
    required this.appService,
    final Key? key,
  }) : super(key: key);

  final TextEditingController toAddressController;
  final TextEditingController amountController;
  final TextEditingController passwordController;
  final GlobalKey<FormState> formKey;
  final AppService appService;

  // TODO Move from UI
  Future<void> onPressed(final BuildContext context) async {
    final transferInfoMeta =
        BlocProvider.of<TransferInfoCubit>(context).metaDTO;
    // transferInfoMeta.
    final txInfo = transferInfoMeta.getTxInfo(appService);
    final params = transferInfoMeta.getParams(
      appService,
      amountController.text,
      toAddressController.text,
    );

    await Transfer(
      txInfo: txInfo,
      params: params,
      // amount: amountController.text,
      appService: appService,
      context: context,
      toAddress: toAddressController.text,
      password: passwordController.text,
      formKey: formKey,
    ).sendFunds();
  }

  @override
  Widget build(final BuildContext context) {
    return BlocBuilder<TransferInfoCubit, TransferInfo?>(
      builder: (final context, final state) => D3pElevatedButton(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        text: 'make_transfer_label'.tr(),
        onPressed: state != null
            ? () => onPressed(context)
            : null, //sendAmount(appService, context) : null,
      ),
    );
  }
}
