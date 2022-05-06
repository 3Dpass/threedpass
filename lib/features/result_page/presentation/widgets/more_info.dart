import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:threedpass/features/hashes_list/domain/entities/hash_object.dart';
import 'package:threedpass/features/hashes_list/domain/entities/snapshot.dart';
import 'package:threedpass/router/router.dart';

class MoreInfo extends StatelessWidget {
  const MoreInfo({
    Key? key,
    required this.snapshot,
    required this.hashObject,
  }) : super(key: key);

  final Snapshot snapshot;
  final HashObject? hashObject;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        MarkdownBody(
          data: "### **Hash ID**\n\n\n### [Show and share](show_and_share)",
          onTapLink: (String text, String? href, String title) {
            context.router.push(
              SaveTopHashesDialogRoute(
                hashObject: hashObject,
                snapshot: snapshot,
              ),
            );
          },
        ),
        Container(
          alignment: Alignment.center,
          child: QrImage(
            padding: EdgeInsets.zero,
            data: snapshot.hashes.join('\n'),
            version: QrVersions.auto,
            size: 120.0,
          ),
        ),
      ],
    );
  }
}
