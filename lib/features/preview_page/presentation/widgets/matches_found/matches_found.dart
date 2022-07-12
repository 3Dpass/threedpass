import 'package:flutter/material.dart';
import 'package:threedpass/core/widgets/error_page.dart';
import 'package:threedpass/features/preview_page/presentation/bloc/preview_page_cubit.dart';
import 'package:threedpass/features/preview_page/presentation/widgets/matches_found/matches_found_text.dart';
import 'package:threedpass/features/preview_page/presentation/widgets/matches_found/no_matches_found_text.dart';

class MatchesFound extends StatelessWidget {
  const MatchesFound({
    Key? key,
    required this.state,
  }) : super(key: key);

  final PreviewPageCubitState state;

  @override
  Widget build(BuildContext context) {
    switch (state.runtimeType) {
      case PreviewNewObject:
        return const NoMatchesFoundText();
      case PreviewNewSnapshot:
        return MatchesFoundText(
          state: state,
          number: state.hashObject!.snapshots.length,
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
