import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:threedpass/features/scan_page/presentation/widgets/get_object_card/get_object_from_file_button.dart';
import 'package:url_launcher/url_launcher_string.dart';

class GetObjectCard extends StatelessWidget {
  const GetObjectCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const GetObjectFromFileButton(),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(
                  Icons.help_center,
                  color: Colors.black,
                ),
                const SizedBox(
                  width: 5,
                ),
                MarkdownBody(
                  data: '### [How to use 3DPass](https://3dpass.org/)',
                  onTapLink: (String text, String? href, String title) =>
                      launchUrlString('https://3dpass.org/'),
                ),
              ],
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
