import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:threedpass/core/theme/d3p_special_colors.dart';
import 'package:threedpass/core/theme/d3p_special_styles.dart';
import 'package:threedpass/core/widgets/text/d3p_body_large_text.dart';
import 'package:threedpass/features/preview_page/bloc/preview_page_cubit.dart';
import 'package:threedpass/router/router.gr.dart';

class MoreInfo extends StatelessWidget {
  const MoreInfo({
    required this.state,
    final Key? key,
  }) : super(key: key);

  final PreviewPageCubitState state;

  void onTap(final BuildContext context) {
    context.router.push(
      SaveTopHashesRoute(
        pageCubitState: state,
      ),
    );
  }

  @override
  Widget build(final BuildContext context) {
    final textStyles = Theme.of(context).customTextStyles;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const D3pBodyLargeText('top_10_hashes'),
            Text.rich(
              TextSpan(
                text: 'show_and_share_dialog_button'.tr(),
                style: textStyles.matchesHyperlink,
                recognizer: TapGestureRecognizer()
                  ..onTap = () => onTap(context),
              ),
            ),
          ],
        ),
        Container(
          alignment: Alignment.center,
          child: QrImageView(
            padding: EdgeInsets.zero,
            data: state.snapshot.hashes.join('\n'),
            version: QrVersions.auto,
            size: 120.0,
            foregroundColor: Theme.of(context).customColors.themeOpposite,
          ),
        ),
      ],
    );
  }
}
