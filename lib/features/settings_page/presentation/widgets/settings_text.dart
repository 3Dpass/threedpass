import 'package:flutter/material.dart';
import 'package:threedpass/common/app_text_styles.dart';
import 'package:threedpass/features/settings_page/domain/entities/settings_config.dart';

extension ToText on SettingsConfig {
  TextSpan get textSpan {
    return TextSpan(
      text: 'Settings\n',
      style: AppTextStyles.bodyText1,
      children: [
        TextSpan(
          text: '- Algoithm: ' + algorithm.name + '\n',
        ),
        TextSpan(
          text: '- Grid: ${gridSize}x$gridSize\n',
        ),
        TextSpan(
          text: '- nSections: $nSections\n',
        ),
      ],
    );
  }
}
