import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:file_picker/file_picker.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:flutter_file_dialog/flutter_file_dialog.dart';


import 'package:flutter_settings_screens/flutter_settings_screens.dart';


class SettingsPage extends StatefulWidget {
  SettingsPage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  goBackToPreviousScreen(BuildContext context){
    Navigator.pop(context);
  }

  _launchURL(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

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
        title: Text("Get a new one"),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: ListView(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
//            Text(
//              'You have pushed the button this many times:',
//            ),
//            Text(
//              '$_counter',
//              style: Theme.of(context).textTheme.headline4,
//            ),
            Container(
                width: 200,
                height: 50,
                // color: Colors.green,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget> [
                    Padding(
                      padding: EdgeInsets.all(16),
                      child: MarkdownBody(
                        data: "Test **markdown** [like this](http://habr.com)",
                        onTapLink: (url) {
                          print("tapped: $url");
                          _launchURL(url);
                        },
                      ),
                    ),
                  ],
                ),

                //image: null,
            ),
            Container(
              width: 200,
              height: 200,
              color: Colors.green,
              //image: null,
            ),
            Container(
              width: 200,
              height: 50,
              color: Colors.yellow,
              //image: null,
            ),
            Container(
              padding: EdgeInsets.all(32.0),
              //width: 400,
              //height: 400,
              child: Center(
                  child: Column(
                    children: <Widget> [
                      SizedBox(
                        width: 400,
                        child: RaisedButton(
                          child: Text('Save this object'),
                          onPressed: () async {
                            String file = await FilePicker.getFilePath();
                            print("Selected file: $file");

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
                  )
              ),
            ),
            Container(
              width: 200,
              height: 100,
              child: Row(
                children: <Widget> [
                  Container(
                    width: 100,
                    height: 100,
                    color: Colors.yellow,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget> [
                        MarkdownBody(
                          data: "**Hash ID**\n[Show and share](show_and_share)",
                          onTapLink: (url) {
                            print("tapped: $url");
                          },
                        ),
                      ],
                    ),
                  ),
                  Container(
                      width: 100,
                      height: 100,
                      child: QrImage(
                        data: "1234567890",
                        version: QrVersions.auto,
                        size: 100.0,
                      ),
                      //color: Colors.blue,
                  ),
                ],
              ),
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
}
