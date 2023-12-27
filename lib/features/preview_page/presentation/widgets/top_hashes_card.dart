import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:threedpass/core/widgets/other/padding_16.dart';
import 'package:threedpass/core/widgets/text/d3p_body_medium_text.dart';
import 'package:threedpass/features/hashes_list/presentation/widgets/hashes_primitive_list.dart';
import 'package:threedpass/features/preview_page/presentation/widgets/copy_text_card.dart';

class TopHashesCard extends StatelessWidget {
  const TopHashesCard({required this.hashes, super.key});

  final List<String> hashes;

  @override
  Widget build(final BuildContext context) {
    if (hashes.isEmpty || (hashes.first.isEmpty && hashes.length == 1)) {
      return const _NoHashesPlaceHolder();
    }

    return Padding16(
      child: CopyTextCard(
        textToShow: 'top_hashes_copied_toast'.tr(),
        textToCopy: hashes.join('\n'),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            HashesPrimitiveList(
              hashes: hashes,
            ),
          ],
        ),
      ),
    );
  }
}

class _NoHashesPlaceHolder extends StatelessWidget {
  const _NoHashesPlaceHolder();

  @override
  Widget build(final BuildContext context) {
    return const Padding16(
      child: D3pBodyMediumText('top_hashes_empty_text'),
    );
  }
}
