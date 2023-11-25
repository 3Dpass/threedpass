import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:threedpass/core/theme/d3p_special_styles.dart';
import 'package:threedpass/core/widgets/other/padding_16.dart';
import 'package:threedpass/features/preview_page/presentation/widgets/copy_text_card.dart';

class StableHashText extends StatelessWidget {
  const StableHashText({
    required this.hashes,
    final Key? key,
  }) : super(key: key);

  final List<String> hashes;

  @override
  Widget build(final BuildContext context) {
    final hashesStr = <String>[];
    // Build pattern "1. hash\n2. hash\n3. hash"
    for (int i = 0; i < hashes.length; i++) {
      String str = (i + 1).toString() + '. ' + hashes[i];
      if (i < hashes.length - 1) {
        str += '\n';
      }
      hashesStr.add(str);
    }

    final children = <TextSpan>[];
    for (final str in hashesStr) {
      children.add(
        TextSpan(
          text: str,
        ),
      );
    }

    final textTheme = Theme.of(context).customTextStyles.d3pBodyMedium;

    return Padding16(
      child: CopyTextCard(
        textToCopy: hashesStr.join('\n'),
        textToShow: 'stable_hashes_copied_toast'.tr(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text.rich(
              TextSpan(
                text: '',
                children: children,
              ),
              style: textTheme,
            ),
          ],
        ),
      ),
    );
  }
}
