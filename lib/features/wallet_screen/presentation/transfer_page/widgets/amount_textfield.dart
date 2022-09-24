part of '../transfer_page.dart';

class _AmountTextFieldBuilder extends StatelessWidget {
  const _AmountTextFieldBuilder({
    Key? key,
    required this.amountController,
  }) : super(key: key);

  final TextEditingController amountController;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransferInfoCubit, TransferInfo>(
      builder: (context, state) => _AmountTextField(
        amountController: amountController,
        balance: state.balance,
      ),
    );
  }
}

class _AmountTextField extends StatelessWidget {
  const _AmountTextField({
    Key? key,
    required this.amountController,
    required this.balance,
  }) : super(key: key);

  final TextEditingController amountController;
  final double balance;

  String? _amountValidator(String? v) {
    return v != null && double.tryParse(v) != null && double.parse(v) <= balance
        ? null
        : 'error_wrong_amount'.tr();
  }

  @override
  Widget build(BuildContext context) {
    final appService = BlocProvider.of<AppServiceLoaderCubit>(context).state;
    return D3pTextFormField(
      labelText: 'amount_label'.tr(
        args: [
          BalanceUtils.balance(
            appService.balance.value.availableBalance,
            appService.networkStateData.safeDecimals,
          ),
        ],
      ),
      controller: amountController,
      hintText: 'amount_hint'.tr(),
      validator: _amountValidator,
    );
  }
}
