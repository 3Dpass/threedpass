import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:threedpass/core/theme/d3p_special_styles.dart';

class FileHashHeader extends StatelessWidget {
  const FileHashHeader({
    required this.fileHash,
    super.key,
  });

  final int fileHash;

  @override
  Widget build(final BuildContext context) {
    final medium = Theme.of(context).textTheme.bodyMedium;
    final faded = Theme.of(context).customTextStyles.fadedBodyMedium;

    return Text.rich(
      TextSpan(
        text: 'file_hash_subtitle_scan_list'.tr(),
        style: faded,
        children: [
          TextSpan(
            text: fileHash.toString(),
            style: medium,
          ),
        ],
      ),
    );
  }
}
