import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:threedpass/features/preview_page/bloc/preview_page_cubit.dart';
import 'package:threedpass/features/preview_page/presentation/widgets/matches_found/match_hyperlink.dart';
import 'package:threedpass/router/router.gr.dart';

class MatchesFoundText extends StatelessWidget {
  const MatchesFoundText({
    Key? key,
    required this.state,
    required this.number,
  }) : super(key: key);

  final PreviewPageCubitState state;
  final int number;

  @override
  Widget build(BuildContext context) {
    return MatchHyperlink(
      mainText: plural('MATCHES_number_plural', number),
      clickable: 'matches_FOUND'.tr(),
      onTap: () => context.router.push(
        CompareWrapperRoute(
          origObj: state.snapshot,
          hashObject: state.hashObject!,
        ),
      ),
    );
  }
}
