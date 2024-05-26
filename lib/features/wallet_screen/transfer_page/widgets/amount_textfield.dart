import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/polkawallet/utils/balance_utils.dart';
import 'package:threedpass/features/wallet_screen/transfer_page/bloc/transfer_info_bloc.dart';
import 'package:threedpass/features/wallet_screen/transfer_page/domain/entities/transfer_meta_dto.dart';
import 'package:threedpass/features/wallet_screen/transfer_page/widgets/basic_transfer_textfield.dart';

class AmountTextFieldBuilder extends StatelessWidget {
  const AmountTextFieldBuilder({
    required this.amountController,
    required this.transferType,
    required this.address,
    final Key? key,
  }) : super(key: key);

  final TextEditingController amountController;
  final MetaInfoType transferType;
  final String address;

  @override
  Widget build(final BuildContext context) {
    final bloc = BlocProvider.of<TransferInfoBloc>(context);
    return ValueListenableBuilder(
      valueListenable: bloc.balanceCacheNotifier,
      builder: (final context, final value, final ___) {
        if (value.containsKey(address)) {
          return _AmountTextField(
            amountController: amountController,
            balance: value[address]!,
            transferType: transferType,
            enabled: true,
          );
        } else {
          return _AmountTextField(
            amountController: amountController,
            balance: 0,
            transferType: transferType,
            enabled: false,
          );
        }
      },
    );
  }
}

class _AmountTextField extends StatelessWidget {
  const _AmountTextField({
    required this.amountController,
    required this.balance,
    required this.transferType,
    required this.enabled,
    final Key? key,
  }) : super(key: key);

  final TextEditingController amountController;
  final MetaInfoType transferType;
  final double balance;
  final bool enabled;

  String? Function(String? v) validator() {
    switch (transferType) {
      case MetaInfoType.coin:
        return _DoubleValidator(balance).amountValidator;
      case MetaInfoType.asset:
        return _DoubleValidator(balance).amountValidator;
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
      enabled: enabled,
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

// class _IntValidator extends _Validator {
//   const _IntValidator(this.balance);

//   final double balance;

//   @override
//   String? amountValidator(final String? v) {
//     if (v != null) {
//       try {
//         final inputD = int.parse(v);

//         if (inputD <= balance && inputD >= 0) {
//           // if (true) {
//           return null;
//         } else {
//           return 'error_wrong_amount_int'.tr();
//         }
//       } on Exception catch (_) {
//         return 'error_wrong_amount_int'.tr();
//       }
//     } else {
//       return 'error_wrong_amount_int'.tr();
//     }
//   }
// }
