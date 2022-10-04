part of '../create_account_from_object.dart';

class _SubmitButton extends StatelessWidget {
  final ValueNotifier<String> chosenHash;

  const _SubmitButton(this.chosenHash);

  void onSubmit(BuildContext context) {
    BlocProvider.of<AccountStoreBloc>(context).add(
      SetAccountSeed(seed: '0x' + chosenHash.value),
    );

    context.router.push(const CreateAccountCredentialsRoute());
  }

  @override
  Widget build(BuildContext context) {
    return D3pElevatedButton(
      text: 'Next'.tr(),
      onPressed: () => onSubmit(context),
    );
  }
}
