import 'package:flutter/material.dart';
import 'package:threedpass/features/wallet_screen/transfer_page/bloc/transfer_info_bloc.dart';
import 'package:threedpass/features/wallet_screen/transfer_page/widgets/to_address_textfield.dart';

class ToCardBasic extends StatelessWidget {
  const ToCardBasic({
    required this.data,
    super.key,
  });

  final ToAddressData data;

  @override
  Widget build(final BuildContext context) {
    return ToAddressTextField(
      toAddressController: data.toAddressController,
    );
  }
}
