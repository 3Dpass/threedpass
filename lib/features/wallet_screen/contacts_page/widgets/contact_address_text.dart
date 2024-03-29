import 'package:flutter/material.dart';
import 'package:threedpass/core/theme/d3p_special_styles.dart';
import 'package:threedpass/core/utils/formatters.dart';

class ContactAddressText extends StatelessWidget {
  final String address;

  const ContactAddressText({required this.address, super.key});

  @override
  Widget build(final BuildContext context) => Text(
        Fmt.shorterAddress(address),
        style: Theme.of(context).customTextStyles.d3pBodyMedium,
      );
}
