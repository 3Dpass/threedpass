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
        D3pBodyMediumText(title ?? 'choose_account_subtitle'),
        const H4(),
        BlocBuilder<ChooseAccountCubit, KeyPairData?>(
          builder: (final context, final state) {
            final chosen = state != null
                ? cac.accounts
                    .firstWhere((element) => element.address == state.address)
                : null;
            return D3pDropdownButton<KeyPairData>(
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
              onChanged: cac.onAccountSelected == null
                  ? null
                  : (final obj) =>
                      obj != null ? cac.setAcc(obj) : emptyFunction(),
              value: chosen,
              validator: (final value) =>
                  value == null ? 'account_never_null'.tr() : null,
            );
          },
        ),
        const H4(),
        BasicPasswordTextField(
          passwordController: cac.passwordController,
        ),
      ],
    );
  }
}
