import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:threedpass/features/home_page/presentation/widgets/get_object_card/get_object_from_file_button.dart';
import 'package:url_launcher/url_launcher.dart';

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
            const Text(
              'Use \'Get from file\' if you\'ve got already a 3D model of your object',
            ),
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
                  data: "### [How to use 3DPass](https://3dpass.org/)",
                  onTapLink: (String text, String? href, String title) {
                    // log("tapped: text=$text href=$href");
                    launch('https://3dpass.org/');
                  },
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
