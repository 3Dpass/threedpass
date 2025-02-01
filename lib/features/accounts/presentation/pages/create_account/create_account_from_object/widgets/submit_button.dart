part of '../create_account_from_object.dart';

class _SubmitButton extends StatelessWidget {
  final ValueNotifier<String> chosenHash;

  const _SubmitButton(this.chosenHash);

  void onSubmit(final BuildContext context) {
    BlocProvider.of<AccountStoreBloc>(context).add(
      SetRawseed(RawseedText(chosenHash.value)),
    );

    unawaited(
      context.router.push(
        CreateAccountCredentialsRoute(
          appbarText: AccountAppbarTitle.import,
        ),
      ),
    );
  }

  @override
  Widget build(final BuildContext context) {
    return D3pElevatedButton(
      text: 'Next'.tr(),
      onPressed: () => onSubmit(context),
    );
  }
}
