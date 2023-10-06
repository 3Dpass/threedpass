import 'package:flutter/material.dart';
import 'package:threedpass/core/widgets/paddings.dart';
import 'package:threedpass/features/wallet_screen/bloc/transfer_info_cubit.dart';
import 'package:threedpass/features/wallet_screen/presentation/transfer_page/widgets/from_address_textfield.dart';
import 'package:threedpass/features/wallet_screen/presentation/transfer_page/widgets/password_textfield.dart';

class FromCardBasic extends StatelessWidget {
  const FromCardBasic({
    required this.data,
    super.key,
  });

  final FromAddressData data;

  @override
  Widget build(final BuildContext context) {
    return Column(
      children: [
        FromAddressTextField(
          data: data,
        ),
        const SizedBoxH4(),
        PasswordTextField(
          passwordController: data.passwordController,
        ),
      ],
    );
  }
}
