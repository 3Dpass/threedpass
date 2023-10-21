import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/utils/validators.dart';
import 'package:threedpass/features/wallet_screen/bloc/transfer_info_cubit.dart';
import 'package:threedpass/features/wallet_screen/presentation/transfer_page/widgets/basic_transfer_textfield.dart';
import 'package:threedpass/features/wallet_screen/presentation/transfer_page/widgets/password_hint.dart';

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({
    required this.passwordController,
    required this.isFirst,
    required this.data,
    final Key? key,
  }) : super(key: key);

  final bool isFirst;
  final FromAddressData data;
  final TextEditingController passwordController;

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<PasswordTextField> {
  bool obscureText = true;

  String? _passValidator(final String? v) {
    return v != null && Validators.checkPassword(v)
        ? null
        : 'create_credentials_password_error'.tr();
  }

  @override
  Widget build(final BuildContext context) {
    return BasicTransferTextField(
      labelText: 'enter_password_label'.tr(),
      controller: widget.passwordController,
      hintText: 'enter_password_hint'.tr(),
      validator: _passValidator,
      obscureText: obscureText,
      maxLines: 1,
      suffixButton: Icon(obscureText ? Icons.visibility : Icons.visibility_off),
      onSuffixButtonPressed: obscureTextPressed,
      labelButton: widget.isFirst ? null : const Icon(Icons.content_paste_go),
      onLabelButtonPressed: () => onLabelButtonPressed(context),
      bottomWidget: widget.isFirst ? null : const PasswordHint(),
    );
  }

  void obscureTextPressed() {
    setState(() {
      obscureText = !obscureText;
    });
  }

  void onLabelButtonPressed(BuildContext context) {
    final transferInfo = BlocProvider.of<TransferInfoCubit>(context);
    transferInfo.copyPasswordIn(widget.data);
  }
}
