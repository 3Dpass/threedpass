import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:threedpass/core/widgets/other/padding_16.dart';
import 'package:threedpass/features/hashes_list/presentation/widgets/hashes_primitive_list.dart';
import 'package:threedpass/features/preview_page/bloc/preview_page_cubit.dart';
import 'package:threedpass/features/preview_page/presentation/widgets/copy_text_card.dart';

class TopHashesCard extends StatelessWidget {
  const TopHashesCard({required this.state, super.key});

  final PreviewPageCubitState state;

  @override
  Widget build(final BuildContext context) {
    final hashes = state.snapshot.hashes;

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
