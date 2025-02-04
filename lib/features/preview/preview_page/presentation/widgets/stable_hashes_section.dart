import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/widgets/other/padding_16.dart';
import 'package:threedpass/core/widgets/text/d3p_body_medium_text.dart';
import 'package:threedpass/features/preview/preview_page/bloc/preview_page_cubit.dart';
import 'package:threedpass/features/preview/preview_page/presentation/widgets/section_title.dart';
import 'package:threedpass/features/preview/preview_page/presentation/widgets/stable_hash_text.dart';

class StableHashesSection extends StatelessWidget {
  const StableHashesSection({super.key});

  @override
  Widget build(final BuildContext context) {
    final hashObject = BlocProvider.of<PreviewPageCubit>(context).hashObject;

    final hashes = hashObject.stableHashes;

    return hashes.isEmpty
        ? const _NoStableHashes()
        : _HasStableHashes(hashes: hashes);
  }
}

class _NoStableHashes extends StatelessWidget {
  const _NoStableHashes({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    return const Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitle(titleUnlocalized: 'no_stable_hash_placeholder'),
        Padding16(child: D3pBodyMediumText('no_stable_hash_help')),
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
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionTitle(titleUnlocalized: 'stable_hashes_list_title'),
        StableHashText(hashes: hashes),
      ],
    );
  }
}
