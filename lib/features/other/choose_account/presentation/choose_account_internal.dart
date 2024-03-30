part of 'choose_account.dart';

class _ChooseAccountInternal extends StatelessWidget {
  const _ChooseAccountInternal({
    required this.title,
  });

  final String? title;

  @override
  Widget build(final BuildContext context) {
    final cac = BlocProvider.of<ChooseAccountCubit>(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBoxH16(),
        D3pBodyMediumText(title ?? 'choose_account_subtitle'),
        const SizedBoxH4(),
        D3pDropdownButton<KeyPairData>(
          context: context,
          isExpanded: true,
          items: cac.accounts
              .map<DropdownMenuItem<KeyPairData>>(
                (final e) => DropdownMenuItem(
                  value: e,
                  child: AccountChooseTileText(
                    name: e.name,
                    address: e.address,
                  ),
                ),
              )
              .toList(),
          onChanged: (final obj) =>
              obj != null ? cac.setAcc(obj) : emptyFunction(),
          value: null,
          validator: (final value) =>
              value == null ? 'account_never_null'.tr() : null,
        ),
        const SizedBoxH4(),
        BasicPasswordTextField(
          passwordController: cac.passwordController,
        ),
      ],
    );
  }
}
