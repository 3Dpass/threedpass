import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:threedpass/common/app_text_styles.dart';
import 'package:threedpass/features/settings_page/domain/entities/settings_config.dart';

extension ToText on SettingsConfig {
  TextSpan get textSpan {
    return TextSpan(
      text: 'settings_title'.tr() + '\n',
      style: AppTextStyles.bodyText1,
      children: [
        TextSpan(
          text: '- ' + 'algorithm_span'.tr() + ':' + algorithm.name + '\n',
        ),
        TextSpan(
          text: '- ' + 'grid_span'.tr() + ': ${gridSize}x$gridSize\n',
        ),
        TextSpan(
          text: '- ' + 'n_sections_span'.tr() + ': $nSections\n',
        ),
      ],
    );
  }
}
