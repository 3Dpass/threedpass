import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:share_plus/share_plus.dart';
import 'package:threedpass/features/hashes_list/domain/entities/hashes_model.dart';
import 'package:threedpass/features/hashes_list/presentation/widgets/hashes_primitive_list.dart';
import 'package:threedpass/features/result_page/presentation/widgets/save_dialog.dart';

class MoreInfo extends StatelessWidget {
  final HashesModel hashesModel;
  const MoreInfo({
    required this.hashesModel,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        MarkdownBody(
          data: "### **Hash ID**\n\n\n### [Show and share](show_and_share)",
          onTapLink: (String text, String? href, String title) {
            print("tapped: text=$text href=$href");
            showHashesDialog(context, hashesModel);
          },
        ),
        Container(
          alignment: Alignment.center,
          child: QrImage(
            padding: EdgeInsets.zero,
            data: "1234567890", // TODO What should be encoded?
            version: QrVersions.auto,
            size: 120.0,
          ),
        ),
      ],
    );
  }
}

Future<void> showHashesDialog(
    BuildContext context, HashesModel hashesModel) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Top 10 hashes'),
        content: SingleChildScrollView(
          child: HashesPrimitiveList(
            hashesModel: hashesModel,
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: Text('Share'),
            onPressed: () {
              Navigator.of(context).pop();
              Share.share(hashesModel.shareText);
            },
          ),
          TextButton(
            child: Text('Save'),
            onPressed: () async {
              Navigator.of(context).pop();
              showDialog(
                context: context,
                barrierDismissible: false, // user must tap button!
                builder: (BuildContext context) => SaveDialog(
                  hashesModelToSave: hashesModel,
                ),
              );
            },
          ),
        ],
      );
    },
  );
}
