import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:threedpass/core/theme/d3p_special_styles.dart';
import 'package:threedpass/core/utils/copy_and_notify.dart';
import 'package:threedpass/core/widgets/buttons/icon_button.dart';
import 'package:threedpass/features/settings_page/domain/entities/scan_settings.dart';

const int $nbsp = 0x00A0; // Non-breaking space

extension ToText on ScanSettings {
  String get prettyTransBytes {
    if (transBytesMode == TransBytesMode.none) {
      return ScanSettings.noneTransBytesKey;
    } else {
      return '0x' + transBytes.toLowerCase();
    }
  }

  List<String> propertiesList() {
    final res = <String>[
      '- ' + 'algorithm_span'.tr() + ': ' + algorithm + '\n',
      '- ' + 'grid_span'.tr() + ': ${gridSize}x$gridSize\n',
      '- ' + 'n_sections_span'.tr() + ': $nSections\n',
      '- ' + 'lib_version_span'.tr() + ': $libVersion\n',
      '- ' + 'trans_bytes_span'.tr() + ': $prettyTransBytes',
    ];
    return res;
  }

  String toRawString() {
    return 'settings_text_span_title'.tr() + '\n' + propertiesList().join();
  }

  TextSpan smartTextSpan(
    final BuildContext context,
    final String tag,
    final String text,
    final String end,
  ) {
    final medium = Theme.of(context).textTheme.bodyMedium;
    final faded = Theme.of(context).customTextStyles.fadedBodyMedium;
    return TextSpan(
      text: tag,
      style: faded,
      children: [
        TextSpan(
          text: text,
          style: medium,
        ),
        TextSpan(
          text: end,
          style: faded,
        ),
      ],
    );
  }

  TextSpan toShort(
    final BuildContext context,
  ) {
    final tags = [
      'A:' + String.fromCharCode($nbsp),
      'G:' + String.fromCharCode($nbsp),
      'N:' + String.fromCharCode($nbsp),
    ];
    final props = [
      algorithm,
      '${gridSize}x$gridSize',
      nSections.toString(),
      // libVersion,
      prettyTransBytes,
    ];
    // Add some props
    final children = <TextSpan>[];
    for (var i = 0; i < tags.length; i++) {
      children.add(
        smartTextSpan(context, tags[i], props[i], '; '),
      );
    }
    // Add transBytes
    if (transBytesMode == TransBytesMode.none) {
      children.add(
        smartTextSpan(
          context,
          'R:' + String.fromCharCode($nbsp),
          ScanSettings.noneTransBytesKey,
          '',
        ),
      );
    } else {
      children.add(
        smartTextSpan(
          context,
          'R:' + String.fromCharCode($nbsp) + '0x',
          prettyTransBytes,
          '',
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
        TextSpan(text: str),
      );
    }

    return TextSpan(
      text: '',
      style: style ?? Theme.of(context).textTheme.bodyMedium,
      children: children,
    );
  }
}
