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
      builder: (final context, final state) => _AmountTextField(
        amountController: amountController,
        balance: state.balance,
      ),
    );
  }
}

// TODO When input 0.2 it throws error
class _AmountTextField extends StatelessWidget {
  const _AmountTextField({
    required this.amountController,
    required this.balance,
    final Key? key,
  }) : super(key: key);

  final TextEditingController amountController;
  final String balance;

  String? _amountValidator(final String? v) {
    return v != null &&
            double.tryParse(v) != null &&
            double.parse(v) <= double.parse(balance)
        ? null
        : 'error_wrong_amount'.tr();
  }

  @override
  Widget build(final BuildContext context) {
    return D3pTextFormField(
      labelText: 'amount_label'.tr(
        args: [
          balance,
        ],
      ),
      controller: amountController,
      hintText: 'amount_hint'.tr(),
      validator: _amountValidator,
    );
  }
}
