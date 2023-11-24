import 'package:flutter/material.dart';
import 'package:threedpass/core/theme/d3p_colors.dart';
import 'package:threedpass/core/theme/d3p_special_styles.dart';

class FileHashHeader extends StatelessWidget {
  const FileHashHeader({
    required this.fileHash,
    super.key,
  });

  final int fileHash;

  @override
  Widget build(final BuildContext context) {
    final medium = Theme.of(context).customTextStyles.d3pBodyMedium;

    return Text.rich(
      TextSpan(
        text: 'File hash: ',
        style: medium.copyWith(color: D3pColors.disabled),
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
