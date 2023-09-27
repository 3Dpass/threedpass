part of '../transfer_page.dart';

class _AmountTextFieldBuilder extends StatelessWidget {
  const _AmountTextFieldBuilder({
    required this.amountController,
    required this.transferMetaDTO,
    required this.balance,
    final Key? key,
  }) : super(key: key);

  final TextEditingController amountController;
  final TransferMetaDTO transferMetaDTO;
  final double balance;

  @override
  Widget build(final BuildContext context) {
    return _AmountTextField(
      amountController: amountController,
      balance: balance,
      transferMetaDTO: transferMetaDTO,
    );
  }
}

class _AmountTextField extends StatelessWidget {
  const _AmountTextField({
    required this.amountController,
    required this.balance,
    required this.transferMetaDTO,
    final Key? key,
  }) : super(key: key);

  final TextEditingController amountController;
  final TransferMetaDTO transferMetaDTO;
  final double balance;

  String? Function(String? v) validator() {
    switch (transferMetaDTO.type) {
      case MetaInfoType.coin:
        return _DoubleValidator(balance).amountValidator;
      case MetaInfoType.asset:
        return _IntValidator(balance).amountValidator;
    }
  }

  @override
  Widget build(final BuildContext context) {
    return BasicTransferTextField(
      labelText: 'amount_label'.tr(
        args: [
          BalanceUtils.doubleFormat(balance),
        ],
      ),
      controller: amountController,
      hintText: 'amount_hint'.tr(),
      validator: validator(),
      keyboardType: TextInputType.number,
    );
  }
}

abstract class _Validator {
  const _Validator();

  String? amountValidator(final String? v);
}

class _DoubleValidator extends _Validator {
  const _DoubleValidator(this.balance);

  final double balance;

  @override
  String? amountValidator(final String? v) {
    if (v != null) {
      try {
        final inputD = double.parse(v);

        if (inputD <= balance && inputD >= 0) {
          return null;
        } else {
          return 'error_wrong_amount'.tr();
        }
      } on Exception catch (_) {
        return 'error_wrong_amount'.tr();
      }
    } else {
      return 'error_wrong_amount'.tr();
    }
  }
}

class _IntValidator extends _Validator {
  const _IntValidator(this.balance);

  final double balance;

  @override
  String? amountValidator(final String? v) {
    if (v != null) {
      try {
        final inputD = int.parse(v);

        if (inputD <= balance && inputD >= 0) {
          // if (true) {
          return null;
        } else {
          return 'error_wrong_amount_int'.tr();
        }
      } on Exception catch (_) {
        return 'error_wrong_amount_int'.tr();
      }
    } else {
      return 'error_wrong_amount_int'.tr();
    }
  }
}
