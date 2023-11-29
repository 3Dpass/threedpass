import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:threedpass/core/theme/d3p_special_styles.dart';
import 'package:threedpass/core/widgets/buttons/elevated_button.dart';
import 'package:threedpass/core/widgets/paddings.dart';

class D3pRPCSubmitButton extends StatelessWidget {
  const D3pRPCSubmitButton({super.key});

  @override
  Widget build(final BuildContext context) {
    final textStyle = Theme.of(context).customTextStyles;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBoxH24(),
        Text(
          'd3rpc_fees_warning'.tr(),
          style: textStyle.secondaryText,
        ),
        const SizedBox(height: 2),
        D3pElevatedButton(
          text: 'Submit'.tr(),
          onPressed: () {},
        ),
      ],
    );
  }
}
