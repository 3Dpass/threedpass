import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:threedpass/core/theme/d3p_special_styles.dart';
import 'package:threedpass/features/settings_page/domain/entities/scan_settings.dart';

extension ToText on ScanSettings {
  List<String> propertiesList() {
    final res = <String>[
      '- ' + 'algorithm_span'.tr() + ': ' + algorithm + '\n',
      '- ' + 'grid_span'.tr() + ': ${gridSize}x$gridSize\n',
      '- ' + 'n_sections_span'.tr() + ': $nSections\n',
      '- ' + 'lib_version_span'.tr() + ': $libVersion\n',
      '- ' + 'trans_bytes_span'.tr() + ': ${transBytes.toLowerCase()}',
    ];
    return res;
  }

  String toRawString() {
    return 'settings_text_span_title'.tr() + '\n' + propertiesList().join();
  }

  TextSpan toText(final BuildContext context, [final TextStyle? style]) {
    final props = propertiesList();
    final children = <TextSpan>[];
    for (final str in props) {
      children.add(
        TextSpan(
          text: str,
        ),
      );
    }
    return TextSpan(
      text: 'settings_text_span_title'.tr() + '\n',
      style: style ?? Theme.of(context).customTextStyles.d3pBodyMedium,
      children: children,
    );
  }
}
