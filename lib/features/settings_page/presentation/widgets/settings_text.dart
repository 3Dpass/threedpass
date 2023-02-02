import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:threedpass/features/settings_page/domain/entities/scan_settings.dart';

extension ToText on ScanSettings {
  TextSpan toText(final BuildContext context) {
    return TextSpan(
      text: 'settings_text_span_title'.tr() + '\n',
      style: Theme.of(context).textTheme.bodyText1,
      children: [
        TextSpan(
          text: '- ' + 'algorithm_span'.tr() + ': ' + algorithm + '\n',
        ),
        TextSpan(
          text: '- ' + 'grid_span'.tr() + ': ${gridSize}x$gridSize\n',
        ),
        TextSpan(
          text: '- ' + 'n_sections_span'.tr() + ': $nSections\n',
        ),
        TextSpan(
          text: '- ' + 'lib_version_span'.tr() + ': $libVersion\n',
        ),
        TextSpan(
          text:
              '- ' + 'trans_bytes_span'.tr() + ': ${transBytes.toLowerCase()}',
        ),
      ],
    );
  }
}
