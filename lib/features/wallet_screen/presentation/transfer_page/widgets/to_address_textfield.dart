part of '../transfer_page.dart';

class _ToAddressTextField extends StatelessWidget {
  const _ToAddressTextField({
    required this.toAddressController,
    final Key? key,
  }) : super(key: key);

  final TextEditingController toAddressController;

  @override
  Widget build(final BuildContext context) {
    return D3pTextFormField(
      labelText: 'to_address_label'.tr(),
      controller: toAddressController,
      maxLines: 1,
      hintText: 'to_address_hint'.tr(),
    );
  }
}
