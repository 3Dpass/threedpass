import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:threedpass/core/theme/d3p_colors.dart';
import 'package:threedpass/core/theme/d3p_special_styles.dart';
import 'package:threedpass/features/settings_page/domain/entities/scan_settings.dart';

const int $nbsp = 0x00A0; // Non-breaking space

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

  TextSpan toShort(
    final BuildContext context,
  ) {
    final medium = Theme.of(context).customTextStyles.d3pBodyMedium;
    final tags = [
      'A: ',
      'G: ',
      'N: ',
      'R:' + String.fromCharCode($nbsp) + '0x',
    ];
    final props = [
      algorithm,
      '${gridSize}x$gridSize',
      nSections.toString(),
      // libVersion,
      transBytes.toLowerCase(),
    ];
    final children = <TextSpan>[];
    for (var i = 0; i < tags.length; i++) {
      children.add(
        TextSpan(
          text: tags[i],
          style: medium.copyWith(color: D3pColors.disabled),
          children: [
            TextSpan(
              text: props[i],
              style: medium,
            ),
            TextSpan(
              text: i != tags.length - 1 ? '; ' : ';',
              style: medium.copyWith(color: D3pColors.disabled),
            ),
          ],
        ),
      );
    }
    return TextSpan(
      text: '',
      // style: ,
      children: children,
    );
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
      text: '',
      style: style ?? Theme.of(context).customTextStyles.d3pBodyMedium,
      children: children,
    );
  }
}
