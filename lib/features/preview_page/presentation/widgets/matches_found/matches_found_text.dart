import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:threedpass/core/utils/empty_function.dart';
import 'package:threedpass/features/preview_page/bloc/preview_page_cubit.dart';
import 'package:threedpass/features/preview_page/presentation/widgets/matches_found/match_hyperlink.dart';
import 'package:threedpass/router/router.gr.dart';

class MatchesFoundText extends StatelessWidget {
  const MatchesFoundText({
    required this.state,
    required this.number,
    final Key? key,
  }) : super(key: key);

  final int number;
  final PreviewPageCubitState state;

  @override
  Widget build(final BuildContext context) {
    return MatchHyperlink(
      mainText: plural('MATCHES_number_plural', number),
      clickable: 'matches_FOUND'.tr(),
      onTap: number > 0
          ? () => context.router.push(
                CompareRouteWrapper(
                  origObj: state.snapshot,
                  hashObject: state.hashObject!,
                ),
              )
          : emptyFunction,
    );
  }
}
