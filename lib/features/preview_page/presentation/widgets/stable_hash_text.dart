import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:threedpass/core/theme/d3p_special_styles.dart';
import 'package:threedpass/core/widgets/other/padding_16.dart';
import 'package:threedpass/features/preview_page/bloc/preview_page_cubit.dart';
import 'package:threedpass/features/preview_page/presentation/widgets/copy_text_card.dart';

class StableHashText extends StatelessWidget {
  const StableHashText({
    required this.state,
    final Key? key,
  }) : super(key: key);

  final PreviewPageCubitState state;

  List<String> stableHashes() {
    switch (state.runtimeType) {
      case PreviewNewSnapshot:
        final stateT = state as PreviewNewSnapshot;
        return stateT.hashObject.stableHashesPlusNew(stateT.snapshot);
      case PreviewExistingSnapshot:
        final stateT = state as PreviewExistingSnapshot;
        return stateT.hashObject.stableHashes;
      case PreviewNewObject:
      default:
        return [];
    }
  }

  @override
  Widget build(final BuildContext context) {
    final hashes = stableHashes();

    if (hashes.isEmpty) {
      return const _Placeholder();
    }

    final hashesStr = <String>[];
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
            Text(
              'stable_hashes_list_title'.tr(),
              style: textTheme,
            ),
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

class _Placeholder extends StatelessWidget {
  const _Placeholder({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    final textStyles = Theme.of(context).customTextStyles;

    return Padding16(
      child: Text.rich(
        TextSpan(
          text: 'no_stable_hash_placeholder'.tr() + '\n',
          style: textStyles.d3pBodyLarge,
          children: [
            TextSpan(
              text: 'no_stable_hash_help'.tr(),
              style: textStyles.d3pBodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}
