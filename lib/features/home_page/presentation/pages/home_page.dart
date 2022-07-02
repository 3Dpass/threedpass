import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:threedpass/common/button_styles.dart';
import 'package:threedpass/features/home_page/presentation/widgets/get_object_from_file_button.dart';
import 'package:threedpass/features/home_page/presentation/widgets/objects_list.dart';
import 'package:threedpass/router/router.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        titleSpacing: 16,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Text("3DPass  "),
            Text(
              "recognize your objects",
              textAlign: TextAlign.end,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Card(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Column(
                  children: [
                    const GetObjectFromFileButton(),
                    const SizedBox(height: 8),
                    const Text(
                      'Use \'Generate from file\' if you\'ve got already a 3D model of your object',
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
                            log("tapped: text=$text href=$href");
                            launch('https://3dpass.org/');
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                  ],
                ),
              ),
            ),
            const Flexible(
              child: ObjectsList(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.black,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            const IconButton(
              icon: Icon(Icons.info, color: Colors.grey),
              onPressed: null,
              //title: Container(), //Text("Add"),
            ),
            IconButton(
              icon: const Icon(Icons.settings, color: Colors.grey),
              onPressed: () {
                context.router.push(const SettingsRoute());
              },
            ),
          ],
        ),
      ),
    );
  }
}
