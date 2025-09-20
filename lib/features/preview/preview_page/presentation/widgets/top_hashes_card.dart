import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:threedpass/core/widgets/other/ph16.dart';
import 'package:threedpass/core/widgets/text/d3p_body_medium_text.dart';
import 'package:threedpass/features/chains/domain/entities/hex_ex.dart';
import 'package:threedpass/features/preview/preview_page/presentation/widgets/copy_text_card.dart';

class TopHashesCard extends StatelessWidget {
  const TopHashesCard({required this.hashes, super.key});

  final List<HexEx> hashes;

  @override
  Widget build(final BuildContext context) {
    if (hashes.isEmpty ||
        (hashes.first.noPrefixValue.isEmpty && hashes.length == 1)) {
      return const _NoHashesPlaceHolder();
    }

    return PH16(
      child: CopyTextCard(
        textToShow: 'top_hashes_copied_toast'.tr(),
        textToCopy: hashes.map((e) => e.prefixValue).join('\n'),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: List.generate(
            hashes.length,
            (final index) => D3pBodyMediumText(
              '${index + 1}. ${hashes[index].prefixValue}',
              translate: false,
            ),
          ),
        ),
      ),
    );
  }
}

class _NoHashesPlaceHolder extends StatelessWidget {
  const _NoHashesPlaceHolder();

  @override
  Widget build(final BuildContext context) {
    return const PH16(
      child: D3pBodyMediumText('top_hashes_empty_text'),
    );
  }
}
