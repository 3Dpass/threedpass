import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:threedpass/core/theme/d3p_special_styles.dart';

class PasswordHint extends StatelessWidget {
  const PasswordHint({super.key});

  @override
  Widget build(final BuildContext context) {
    final textStyle = Theme.of(context).customTextStyles.hintStyle;

    return Padding(
      padding: const EdgeInsets.only(top: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text.rich(
            TextSpan(
              text: 'password_hint_1'.tr(),
              children: [
                WidgetSpan(
                  child: Icon(
                    Icons.content_paste_go,
                    size: 14,
                    color: textStyle.color,
                  ),
                ),
                TextSpan(text: 'password_hint_2'.tr()),
              ],
              style: textStyle,
            ),
          ),
        ],
      ),
    );
  }
}
