import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:threedpass/core/widgets/error_page.dart';

import 'package:threedpass/features/result_page/presentation/bloc/preview_page_cubit.dart';
import 'package:threedpass/router/router.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

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
        return const _NoMatchesFound();
      case PreviewNewSnapshot:
        return _MatchesFound(
          state: state,
          number: state.hashObject!.snapshots.length,
        );
      case PreviewExistingSnapshot:
        return _MatchesFound(
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

// TODO Refactor!!
class _MatchesFound extends StatelessWidget {
  const _MatchesFound({
    required this.state,
    required this.number,
  });

  final PreviewPageCubitState state;
  final int number;

  @override
  Widget build(BuildContext context) {
    return _ClickableText(
      mainText: plural('MATCHES_number_plural', number),
      clickable: 'matches_FOUND'.tr(),
      onTap: () {
        context.router.push(
          CompareWrapperRoute(
            origObj: state.snapshot,
            hashObject: state.hashObject!,
          ),
        );
      },
    );
  }
}

// TODO Refactor!!
class _NoMatchesFound extends StatelessWidget {
  const _NoMatchesFound();

  @override
  Widget build(BuildContext context) {
    return _ClickableText(
      mainText: plural('MATCHES_number_plural', 0),
      clickable: 'WHY_not_found'.tr(),
      onTap: () {
        launchUrlString(
            'https://3dpass.org/features.html#3D_object_recognition');
      },
    );
  }
}

// TODO Refactor!!
class _ClickableText extends StatelessWidget {
  const _ClickableText({
    required this.clickable,
    required this.mainText,
    required this.onTap,
  });

  final String clickable;
  final String mainText;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    TextStyle defaultStyle = const TextStyle(color: Colors.black);
    TextStyle linkStyle = const TextStyle(color: Colors.blue);

    return RichText(
      text: TextSpan(
        style: defaultStyle,
        children: <TextSpan>[
          TextSpan(text: mainText),
          TextSpan(
            text: clickable,
            style: linkStyle,
            recognizer: TapGestureRecognizer()..onTap = onTap,
          ),
        ],
      ),
    );
  }
}
