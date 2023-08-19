part of '../transfer_page.dart';

class _AmountTextFieldBuilder extends StatelessWidget {
  const _AmountTextFieldBuilder({
    required this.amountController,
    final Key? key,
  }) : super(key: key);

  final TextEditingController amountController;

  @override
  Widget build(final BuildContext context) {
    return BlocBuilder<TransferInfoCubit, TransferInfo>(
      buildWhen: (final previous, final current) =>
          previous.balance != current.balance,
      builder: (final context, final state) => _AmountTextField(
        amountController: amountController,
        balance: state.balance,
      ),
    );
  }
}

class _AmountTextField extends StatelessWidget {
  const _AmountTextField({
    required this.amountController,
    required this.balance,
    final Key? key,
  }) : super(key: key);

  final TextEditingController amountController;
  final double balance;

  String? _amountValidator(final String? v) {
    if (v != null) {
      try {
        final inputD = double.parse(v);

        if (inputD <= balance) {
          return null;
        } else {
          getIt<Logger>().e(
            '_amountValidator. input > balance. input: $v, balance: $balance',
          );
          return 'error_wrong_amount'.tr();
        }
      } on Exception catch (_) {
        getIt<Logger>().e('_amountValidator. v is NOT double');
        return 'error_wrong_amount'.tr();
      }
    } else {
      getIt<Logger>().e('_amountValidator. v is null');
      return 'error_wrong_amount'.tr();
    }
  }

  @override
  Widget build(final BuildContext context) {
    return D3pTextFormField(
      labelText: 'amount_label'.tr(
        args: [
          BalanceUtils.doubleFormat(balance),
        ],
      ),
      controller: amountController,
      hintText: 'amount_hint'.tr(),
      validator: _amountValidator,
      keyboardType: TextInputType.number,
    );
  }
}
