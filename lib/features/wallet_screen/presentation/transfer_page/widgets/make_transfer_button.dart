part of '../transfer_page.dart';

class _MakeTransferButton extends StatelessWidget {
  const _MakeTransferButton({
    required this.formKey,
    required this.appService,
    final Key? key,
  }) : super(key: key);

  final GlobalKey<FormState> formKey;
  final AppService appService;

  Future<void> onPressed(final BuildContext context) async {
    final transferInfoMeta = BlocProvider.of<TransferInfoBloc>(context);

    await transferInfoMeta.sendTransfer(
      formKey: formKey,
      context: context,
    );
  }

  @override
  Widget build(final BuildContext context) {
    return BlocBuilder<TransferInfoBloc, TransferInfoBlocState?>(
      builder: (final context, final state) => D3pElevatedButton(
        text: 'make_transfer_label'.tr(),
        onPressed: state != null
            ? () => onPressed(context)
            : null, //sendAmount(appService, context) : null,
      ),
    );
  }
}
