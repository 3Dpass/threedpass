import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/features/wallet_screen/transfer_page/bloc/transfer_info_bloc.dart';
import 'package:threedpass/features/wallet_screen/transfer_page/widgets/basic_password_text_field.dart';
import 'package:threedpass/features/wallet_screen/transfer_page/widgets/password_hint.dart';

class PasswordTextField extends StatelessWidget {
  const PasswordTextField({
    required this.passwordController,
    required this.isFirst,
    required this.data,
    final Key? key,
  }) : super(key: key);

  final bool isFirst;
  final FromAddressData data;
  final TextEditingController passwordController;

  void onLabelButtonPressed(final BuildContext context) {
    final transferInfo = BlocProvider.of<TransferInfoBloc>(context);
    transferInfo.add(CopyPasswordEvent(data));
  }

  @override
  Widget build(final BuildContext context) {
    return BasicPasswordTextField(
      passwordController: passwordController,
      labelButton: isFirst ? null : Icons.content_paste_go,
      onLabelButtonPressed: () => onLabelButtonPressed(context),
      bottomWidget: isFirst ? null : const PasswordHint(),
    );
  }
}
