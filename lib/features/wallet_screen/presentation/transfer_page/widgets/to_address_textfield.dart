part of '../transfer_page.dart';

class _ToAddressTextField extends StatelessWidget {
  const _ToAddressTextField({
    Key? key,
    required this.toAddressController,
  }) : super(key: key);

  final TextEditingController toAddressController;

  @override
  Widget build(BuildContext context) {
    final appService = BlocProvider.of<AppServiceLoaderCubit>(context).state;
    return D3pTextFormField(
      labelText: 'to_address_label'.tr(),
      controller: toAddressController,
      maxLines: 1,
      hintText: 'to_address_hint'.tr(),
    );
  }
}
