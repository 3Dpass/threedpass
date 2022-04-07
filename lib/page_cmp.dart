import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:file_picker/file_picker.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:flutter_file_dialog/flutter_file_dialog.dart';
import 'page_settings.dart';
import 'main.dart';
import 'object3d.dart';

class CmpPage extends StatefulWidget {
  CmpPage({Key? key, required this.title, required this.home})
      : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;
  final HomePageOLDState home;

  @override
  _CmpPageState createState() => _CmpPageState();
}

class _CmpPageState extends State<CmpPage> {
  final _controller = TextEditingController();

  String _obj1 = 'one';
  String _obj2 = 'two';

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
        title: Text("Compare top hashes"),
      ),
      // body: Center(

      body: Column(
        //alignment: Alignment.topCenter,
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        //padding: EdgeInsets.all(16),
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: this._buildList(true),
              ),
              Expanded(
                  child: Text(
                "VS",
                textAlign: TextAlign.center,
              )),
              Expanded(
                child: this._buildList(false),
              ),
            ],
          ),
          Divider(
            height: 15,
            thickness: 3,
            color: Colors.black,
          ),
          Container(
              child: DataTable(
            columns: const <DataColumn>[
              DataColumn(
                label: Text(
                  'Rank',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
              DataColumn(
                label: Text(
                  'Hash',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
              DataColumn(
                label: Text(
                  'Rank',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
            ],
            rows: const <DataRow>[
              DataRow(
                cells: <DataCell>[
                  DataCell(Text('1')),
                  DataCell(Text('123233e31132dee12345a')),
                  DataCell(Text('6')),
                ],
              ),
              DataRow(
                cells: <DataCell>[
                  DataCell(Text('2')),
                  DataCell(Text('4311aa5b1a1345ff251345')),
                  DataCell(Text('1')),
                ],
              ),
              DataRow(
                cells: <DataCell>[
                  DataCell(Text('3')),
                  DataCell(Text('87787611288a66282e1345')),
                  DataCell(Text('3')),
                ],
              ),
            ],
          )),
        ],
      ),
//      floatingActionButton: FloatingActionButton(
//        onPressed: () { goBackToPreviousScreen(context); },
//        tooltip: 'Back',
//        child: Icon(Icons.arrow_back),
//      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  _buildList(bool first) {
    String sel = "";
    if (first) {
      sel = _obj1;
    } else {
      sel = _obj2;
    }

    return Container(
//                        width: 120,
//                        height: 120,
      alignment: Alignment.center,
      child: DropdownButton<String>(
        items: [
          DropdownMenuItem<String>(
            child: Text("Object 1"),
            value: 'one',
          ),
          DropdownMenuItem<String>(
            child: Text("Object 2"),
            value: 'two',
          ),
          DropdownMenuItem<String>(
            child: Text("Object 3"),
            value: 'three',
          ),
        ],
        onChanged: (String? value) {
          if (value != null) {
            setState(() {
              if (first) {
                _obj1 = value;
              } else {
                _obj2 = value;
              }
            });
          }
        },
        hint: Text('Select Item'),
        value: sel,
      ),
    );
  }
}
