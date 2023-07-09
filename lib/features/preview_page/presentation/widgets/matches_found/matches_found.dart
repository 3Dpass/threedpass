import 'package:flutter/material.dart';
import 'package:threedpass/core/widgets/error_page.dart';
import 'package:threedpass/features/preview_page/bloc/preview_page_cubit.dart';
import 'package:threedpass/features/preview_page/presentation/widgets/matches_found/matches_found_text.dart';
import 'package:threedpass/features/preview_page/presentation/widgets/matches_found/no_matches_found_text.dart';

class MatchesFound extends StatelessWidget {
  const MatchesFound({
    required this.state,
    final Key? key,
  }) : super(key: key);

  final PreviewPageCubitState state;

  @override
  Widget build(final BuildContext context) {
    switch (state.runtimeType) {
      case PreviewNewObject:
        return const NoMatchesFoundText();
      case PreviewNewSnapshot:
        return MatchesFoundText(
          state: state,
          number: state.hashObject!.snapshots
              .length, // TODO Calc real mathches, not just count snapshots
        );
      case PreviewExistingSnapshot:
        return MatchesFoundText(
          state: state,
          number: state.hashObject!.snapshots.length - 1,
        );
      default:
        return const ErrorPage(
          error: '[MatchesFound] Unknown state for PreviewPageCubitState',
        );
    }
  }
}
