import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:threedpass/common/button_styles.dart';
import 'package:threedpass/features/object3d/presentation/widgets/object3d.dart';
import 'package:threedpass/features/result_page/presentation/widgets/hash_properties.dart';
import 'package:threedpass/features/result_page/presentation/widgets/more_info.dart';

class ResultPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text("Get a new one"),
            IconButton(
              icon: Icon(Icons.share, color: Colors.grey),
              alignment: Alignment.centerRight,
              onPressed: () {
                // widget.home.share(context, widget.home.result);
              },
            )
          ],
        ),
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          padding: EdgeInsets.all(5.0),
          child: Wrap(
            spacing: 2.0,
            runSpacing: 2.0,
            alignment: WrapAlignment.center,
            runAlignment: WrapAlignment.start,
            children: <Widget>[
              Container(
                constraints: BoxConstraints.expand(height: 40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: MarkdownBody(
                        data: "### 3 mathes [found](http://habr.com)",
                        onTapLink: (String text, String? href, String title) {
                          print("tapped: text=$text href=$href");
                          // this.widget.home.gotoCmpPage(context);
                        },
                      ),
                    ),
                    //),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(16.0),
                color: Colors.grey,
                child: Object3D(
                  size: Size(300.0, 150.0),
                  zoom: 2.0,
                  //path: "assets/brain.obj",
                  path: "assets/scan1_low.obj",
                ),
              ),
              Container(
                padding: EdgeInsets.all(15),
                constraints: BoxConstraints.expand(height: 90),
                child: HashProperties(),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Center(
                  child: Column(
                    children: <Widget>[
                      ElevatedButton(
                        style: AppButtonStyles.primaryButton,
                        child: Text('Save this object'),
                        onPressed: () async {
                          // await showSaveDialog();
                        },
                      ),
                      ElevatedButton(
                        style: AppButtonStyles.primaryButton,
                        child: Text('Remove & clear the cache'),
                        onPressed: () {
                          // goBackToPreviousScreen(context);
                        },
                      ),
                    ],
                  ),
                ),
              ),
              MoreInfo(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.black,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.info, color: Colors.grey),
              onPressed: null,
              //title: Container(), //Text("Add"),
            ),
            IconButton(
              icon: Icon(Icons.settings, color: Colors.grey),
              onPressed: () {
                // widget.home.openAppSettings(context);
              },
              //title: Container(), //Text("Delete"),
            ),
          ],
        ),
      ),
    );
  }
}
