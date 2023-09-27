part of '../transfer_page.dart';

class _ToAddressTextField extends StatelessWidget {
  const _ToAddressTextField({
    required this.toAddressController,
    final Key? key,
  }) : super(key: key);

  final TextEditingController toAddressController;

  @override
  Widget build(final BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        child: BasicTransferTextField(
          labelText: 'to_address_label'.tr(),
          controller: toAddressController,
          maxLines: 1,
          hintText: 'to_address_hint'.tr(),
        ),
      ),
    );
  }
}
