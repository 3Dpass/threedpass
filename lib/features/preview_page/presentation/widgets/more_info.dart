import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:threedpass/features/preview_page/bloc/preview_page_cubit.dart';
import 'package:threedpass/router/router.gr.dart';

class MoreInfo extends StatelessWidget {
  const MoreInfo({
    required this.state,
    final Key? key,
  }) : super(key: key);

  final PreviewPageCubitState state;

  @override
  Widget build(final BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        MarkdownBody(
          data: '### **Hash ID**\n### [' +
              'show_and_share_dialog_button'.tr() +
              '](pseudo_link)',
          onTapLink:
              (final String text, final String? href, final String title) =>
                  context.router.push(
            SaveTopHashesDialogRoute(
              pageCubitState: state,
            ),
          ),
        ),
        Container(
          alignment: Alignment.center,
          child: QrImage(
            padding: EdgeInsets.zero,
            data: state.snapshot.hashes.join('\n'),
            version: QrVersions.auto,
            size: 120.0,
            foregroundColor: Theme.of(context).colorScheme.onBackground,
          ),
        ),
      ],
    );
  }
}
