import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:threedpass/core/theme/d3p_special_styles.dart';

class SettingsSectionHeader extends StatelessWidget {
  const SettingsSectionHeader({
    required this.title,
    this.additionalText = '',
    final Key? key,
  }) : super(key: key);

  final String title;
  final String additionalText;

  @override
  Widget build(final BuildContext context) {
    final textStyles = Theme.of(context).customTextStyles;

    return Padding(
      padding: const EdgeInsets.only(
        left: 16,
        right: 16,
        top: 8,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text.rich(
            TextSpan(
              text: title.tr(),
              style: textStyles.d3pSettingsHeader,
              children: [
                TextSpan(
                  text: additionalText,
                  style: textStyles.d3pSettingsHeaderSmall,
                ),
              ],
            ),
          ),
          const Divider(),
        ],
      ),
    );
  }
}
