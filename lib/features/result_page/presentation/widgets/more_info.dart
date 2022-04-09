import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:qr_flutter/qr_flutter.dart';

class MoreInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                MarkdownBody(
//                              styleSheet: MarkdownStyleSheet(
//                                s: TextStyle(color: Colors.blue, fontSize: 40),
//                              ),
                  data:
                      "### **Hash ID**\n\n\n### [Show and share](show_and_share)",
                  onTapLink: (String text, String? href, String title) {
                    print("tapped: text=$text href=$href");
                    // showHashesDialog();
                  },
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: QrImage(
              data: "1234567890", // TODO What should be encoded?
              version: QrVersions.auto,
              size: 120.0,
            ),
          ),
        ],
      ),
    );
  }
}
