import 'package:flutter/material.dart';
import 'package:threedpass/core/theme/d3p_special_styles.dart';
import 'package:threedpass/core/utils/formatters.dart';

class AccountChooseTileText extends StatelessWidget {
  const AccountChooseTileText({
    required this.address,
    required this.name,
    super.key,
  });

  final String? name;
  final String? address;

  String fixedName() {
    if (name != null) {
      return name! + '   ';
    } else {
      return '';
    }
  }

  String shortAddress() {
    return Fmt.shorterAddress(address);
  }

  @override
  Widget build(final BuildContext context) {
    final fadedBodyMedium = Theme.of(context).customTextStyles.fadedBodyMedium;
    return Text.rich(
      TextSpan(
        text: fixedName(),
        children: [
          TextSpan(
            text: shortAddress(),
            style: fadedBodyMedium,
          ),
        ],
      ),
    );
  }
}
