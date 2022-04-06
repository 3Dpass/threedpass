import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:file_picker/file_picker.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:flutter_file_dialog/flutter_file_dialog.dart';
import 'page_settings.dart';
import 'main.dart';
import 'page_cmp.dart';
import 'object3d.dart';

class ResultPage extends StatefulWidget {
  ResultPage({
    Key? key,
    required this.title,
    required this.home,
  }) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;
  final HomePageState home;

  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _controller.dispose();
    super.dispose();
  }

  goBackToPreviousScreen(BuildContext context) {
    Navigator.pop(context);
  }

  _launchURL(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<void> showSaveDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Save hashes'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Save top hashes as:'),
                Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: TextField(
                        controller: this._controller,
                        onSubmitted: (String value) async {
                          // await widget.home.saveHashes(value, widget.home.result);
                        })),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: Text('Save'),
              onPressed: () async {
                Navigator.of(context).pop();
                String value = this._controller.text;
                await widget.home.saveHashes(value, widget.home.result);
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> showHashesDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Top 10 hashes'),
          content: SingleChildScrollView(
            child: ListBody(
              children: _buildHashes(),
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: Text('Share'),
              onPressed: () {
                Navigator.of(context).pop();
                widget.home.share(context, widget.home.result);
              },
            ),
            FlatButton(
              child: Text('Save'),
              onPressed: () async {
                Navigator.of(context).pop();
                await showSaveDialog();
              },
            ),
          ],
        );
      },
    );
  }

  List<Widget> _buildHashes() {
    int len = widget.home.result.length;
    return new List<Widget>.generate(len, (int index) {
      return Text(widget.home.result[index]);
    });
  }

//  Future<void> showOverlapPage() async {
//    return showDialog<void>(
//      context: context,
//      barrierDismissible: false, // user must tap button!
//      builder: (BuildContext context) {
//        return AlertDialog(
//          title: Text('Top 10 hashes'),
//          content: SingleChildScrollView(
//            child: ListBody(
//              children: <Widget>[
//                Text('Show overlaps'),
//                Text('Not implemented'),
//              ],
//            ),
//          ),
//          actions: <Widget>[
//            FlatButton(
//              child: Text('Close'),
//              onPressed: () {
//                Navigator.of(context).pop();
//              },
//            ),
//          ],
//        );
//      },
//    );
//  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            //Text(widget.title),
            Text("Get a new one"),
            IconButton(
              icon: Icon(Icons.share, color: Colors.grey),
              alignment: Alignment.centerRight,
              onPressed: () {
                widget.home.share(context, widget.home.result);
              },
            )
          ],
        ),
      ),
      // body: Center(

      body: Align(
        alignment: Alignment.topCenter,
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        //padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          //shrinkWrap: true,
          padding: EdgeInsets.all(5.0),
          // child: Column (
          child: Wrap(
            spacing: 2.0,
            runSpacing: 2.0,
            alignment: WrapAlignment.center,
            runAlignment: WrapAlignment.start,
            children: <Widget>[
              //            Text(
              //              'You have pushed the button this many times:',
              //            ),
              //            Text(
              //              '$_counter',
              //              style: Theme.of(context).textTheme.headline4,
              //            ),
              Container(
//                  width: 200,
//                  height: 50,
                constraints: BoxConstraints.expand(height: 40),
                //color: Colors.yellow,
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
//                           },
                          //_launchURL(url);
                          this.widget.home.gotoCmpPage(context);
                        },
                      ),
                    ),
                    //),
                  ],
                ),

                //image: null,
              ),
//              Container(
//                padding: EdgeInsets.all(32.0),
//
//                width: 200,
//                height: 200,
//                color: Colors.green,
//                //image: null,
//              ),
              Container(
                padding: EdgeInsets.all(15.0),
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
                //width: 200,
                //height: 50,
                //color: Colors.yellow,
                //image: null
                //child: this._buildProp(),
                child: this._buildProp(),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                //width: 400,
                //height: 400,
                //color: Colors.yellow,
                child: Center(
                    child: Column(
                  children: <Widget>[
                    SizedBox(
                      width: 400,
                      child: RaisedButton(
                        child: Text('Save this object'),
                        onPressed: () async {
                          //String file = await FilePicker.getFilePath();
                          await showSaveDialog();
                          //print("Selected file: $file");

                          //goBackToPreviousScreen(context);
                        },
                      ),
                    ),
                    SizedBox(
                      width: 400,
                      child: RaisedButton(
                        child: Text('Remove & clear the cache'),
                        onPressed: () {
                          goBackToPreviousScreen(context);
                        },
                      ),
                    ),
                  ],
                )),
              ),
              Container(
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          //                      width: 120,
                          //                      height: 120,
                          //color: Colors.yellow,
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
                                onTapLink:
                                    (String text, String? href, String title) {
                                  print("tapped: text=$text href=$href");
                                  showHashesDialog();
                                  // print("tapped: $url");
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
//                        width: 120,
//                        height: 120,
                          alignment: Alignment.center,
                          child: QrImage(
                            data: "1234567890",
                            version: QrVersions.auto,
                            size: 120.0,
                          ),
                          //color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.black,
//      Theme(
//        data: Theme.of(context).copyWith(
//          // sets the background color of the `BottomNavigationBar`
//            canvasColor: Colors.black,
//            // sets the active color of the `BottomNavigationBar` if `Brightness` is light
//            primaryColor: Colors.grey,
//            textTheme: Theme
//                .of(context)
//                .textTheme
//                .copyWith(caption: new TextStyle(color: Colors.grey,))), // sets the inactive color of the `BottomNavigationBar`
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
                widget.home.openAppSettings(context);
              },
              //title: Container(), //Text("Delete"),
            ),
          ],
        ),
      ),
//      floatingActionButton: FloatingActionButton(
//        onPressed: () { goBackToPreviousScreen(context); },
//        tooltip: 'Back',
//        child: Icon(Icons.arrow_back),
//      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  _buildProp() => SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Text("Strong"),
            Padding(
              padding: EdgeInsets.all(5),
              child: LinearProgressIndicator(
                value: 0.6,
              ),
            ),
            Text("Properties:"),
            Text("- 256bit"),
          ],
        ),
      );
}
