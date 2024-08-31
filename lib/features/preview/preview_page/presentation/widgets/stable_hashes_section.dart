import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/widgets/other/padding_16.dart';
import 'package:threedpass/core/widgets/text/d3p_body_medium_text.dart';
import 'package:threedpass/features/preview/preview_page/bloc/preview_page_cubit.dart';
import 'package:threedpass/features/preview/preview_page/presentation/widgets/section_title.dart';
import 'package:threedpass/features/preview/preview_page/presentation/widgets/stable_hash_text.dart';

class StableHashesSection extends StatelessWidget {
  const StableHashesSection({super.key});

  List<String> stableHashes(final PreviewPageCubitState state) {
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
    final state = BlocProvider.of<PreviewPageCubit>(context).state;

    final hashes = stableHashes(state);

    if (hashes.isEmpty) {
      return const _NoStableHashes();
    } else {
      return _HasStableHashes(hashes: hashes);
    }
  }
}

class _NoStableHashes extends StatelessWidget {
  const _NoStableHashes({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        SectionTitle(titleUnlocalized: 'no_stable_hash_placeholder'),
        Padding16(
          child: D3pBodyMediumText('no_stable_hash_help'),
        ),
      ],
    );
  }
}

class _HasStableHashes extends StatelessWidget {
  const _HasStableHashes({required this.hashes});

  final List<String> hashes;

  @override
  Widget build(final BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const SectionTitle(titleUnlocalized: 'stable_hashes_list_title'),
        StableHashText(
          hashes: hashes,
        ),
      ],
    );
  }
}
