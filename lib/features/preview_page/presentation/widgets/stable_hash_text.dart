import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:threedpass/features/preview_page/bloc/preview_page_cubit.dart';

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

    final children = <TextSpan>[];
    for (int i = 0; i < hashes.length; i++) {
      children.add(
        TextSpan(
          text: (i + 1).toString() + '. ' + hashes[i] + '\n',
        ),
      );
    }

    return Text.rich(
      TextSpan(
        text: 'stable_hashes_list_title'.tr() + '\n',
        children: children,
      ),
      style: Theme.of(context).textTheme.bodyLarge,
    );
  }
}

class _Placeholder extends StatelessWidget {
  const _Placeholder({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) => Text.rich(
        TextSpan(
          text: 'no_stable_hash_placeholder'.tr() + '\n',
          style: Theme.of(context).textTheme.bodyLarge,
          children: [
            TextSpan(
              text: 'no_stable_hash_help'.tr(),
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      );
}
