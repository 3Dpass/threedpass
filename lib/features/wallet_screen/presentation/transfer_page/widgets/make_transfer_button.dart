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

  Future<void> onPressed(final BuildContext context) async {
    final transferInfoMeta = BlocProvider.of<TransferInfoCubit>(context);

    await transferInfoMeta.sendTransfer(
      toAddress: toAddressController.text,
      amount: amountController.text,
      password: passwordController.text,
      formKey: formKey,
      context: context,
    );
  }

  @override
  Widget build(final BuildContext context) {
    return BlocBuilder<TransferInfoCubit, TransferInfo?>(
      builder: (final context, final state) => D3pElevatedButton(
        text: 'make_transfer_label'.tr(),
        onPressed: state != null
            ? () => onPressed(context)
            : null, //sendAmount(appService, context) : null,
      ),
    );
  }
}
