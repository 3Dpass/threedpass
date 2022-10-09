part of '../transfer_page.dart';

class _FromAddressTextField extends StatelessWidget {
  const _FromAddressTextField({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    final appService = BlocProvider.of<AppServiceLoaderCubit>(context).state;
    return D3pTextFormField(
      enabled: false,
      labelText: 'from_address_label'.tr(),
      controller: TextEditingController(
        text: Fmt.shorterAddress(
          appService.keyring.current.address,
        ),
      ),
    );
  }
}
