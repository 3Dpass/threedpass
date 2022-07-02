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
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
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
            Container(
              padding: const EdgeInsets.all(15.0),
              child: Center(
                child: Column(
                  children: const [
                    GetObjectFromFileButton(),
                    // const SizedBox(
                    //   height: 5,
                    // ),
                    // SizedBox(
                    //   child: ElevatedButton.icon(
                    //     style: AppButtonStyles.primaryButton,
                    //     icon: const Icon(Icons.camera_alt),
                    //     label: const Text('Scan by camera'),
                    //     onPressed: () async {
                    //       log('on scan pressed');
                    //     },
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
            Card(
              child: Container(
                padding: const EdgeInsets.all(1.0),
                child: Column(
                  children: <Widget>[
                    const Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                          'Use \'Generate from file\' if you\'ve got already a 3D model of your object'),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 10, top: 0, right: 0, bottom: 10),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.help_center,
                              color: Colors.black,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            MarkdownBody(
                              data:
                                  "### [How to use 3DPass](https://3dpass.org/)",
                              onTapLink:
                                  (String text, String? href, String title) {
                                log("tapped: text=$text href=$href");
                                launch('https://3dpass.org/');
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
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
