import 'dart:io';
import 'package:flutter/services.dart'; // PlatformException
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:share_plus/share_plus.dart';
import 'package:threedpass/features/hashes_list/domain/entities/hashes_model.dart';
import 'package:threedpass/features/hashes_list/presentation/bloc/hashes_list_bloc.dart';
import 'package:threedpass/features/home_page/presentation/pages/home_page.dart';
import 'package:threedpass/features/settings_page/presentation/cubit/settings_page_cubit.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_file_dialog/flutter_file_dialog.dart';
import 'package:path_provider/path_provider.dart';

import 'page_cmp.dart';

import 'package:threedpass/setup.dart' as di_setup;

// bool _isDarkTheme = true;
// bool _isUsingHive = true;

// Future<void> initSettings() async {
//   await Settings.init(
//     cacheProvider: _isUsingHive ? HiveCache() : SharePreferenceCache(),
//   );
// }

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Hive.registerAdapter(HashesModelAdapter());
  Directory defaultDirectory = await getApplicationDocumentsDirectory();
  Hive.init(defaultDirectory.path);

  await di_setup.setup();

  runApp(ThreeDApp());
}

class ThreeDApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HashesListBloc>(
          create: (_) => di_setup.getIt<HashesListBloc>(),
        ),
        BlocProvider<SettingsConfigCubit>(
          create: (_) => di_setup.getIt<SettingsConfigCubit>(),
        ),
      ],
      child: MaterialApp(
        title: '3DPass',
        theme: ThemeData(
          primarySwatch: Colors.green,
          primaryColor: Colors.black,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: HomePage(),
      ),
    );
  }
}

class HomePageOLD extends StatefulWidget {
  HomePageOLD({Key? key}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  // final String title;

  @override
  HomePageOLDState createState() => HomePageOLDState();
}

class HomePageOLDState extends State<HomePageOLD> {
  int _counter = 0;
  bool _isBusy = false;
  OpenFileDialogType _dialogType = OpenFileDialogType.image;
  SourceType _sourceType = SourceType.photoLibrary;
  bool _allowEditing = false;
  // File _currentFile;
  // String _savedFilePath;
  bool _localOnly = false;

  // settings
  int grid_size = 7;
  int n_sections = 10;

  late List<String> _result;
  // ProgressDialog? _pr = null;

  List<String> get result {
    return _result;
  }

  // HiveStore hs = HiveStore();

  // @override
  // void initState() {
  //   hs.init() // .whenComplete() {
  //       .then((result) {
  //     print("HiveStore initielized");
  //     setState(() {});
  //   });
  //   super.initState();
  // }

  // void _incrementCounter() {
  //   setState(() {
  //     // This call to setState tells the Flutter framework that something has
  //     // changed in this State, which causes it to rerun the build method below
  //     // so that the display can reflect the updated values. If we changed
  //     // _counter without calling setState(), then the build method would not be
  //     // called again, and so nothing would appear to happen.
  //     _counter++;
  //   });
  // }

  _launchURL(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  onProgress(dynamic message) async {
    print("onProgress: $message");
    // _pr!.update(value: message["pct"].toDouble(), msg: message["desc"]);
//    Future.delayed(Duration(seconds: 1)).then((onvalue) {
//      _pr.update(
//          progress: 50.0,
//          message: "wwww",
//      );
//    });
    print("onProgress: $message");
    await Future.delayed(Duration(seconds: 5));
  }

  // Future<void> _process(BuildContext context) async {
  //   return showDialog<void>(
  //     context: context,
  //     barrierDismissible: false, // user must tap button!
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         content: SingleChildScrollView(
  //           child: ListBody(
  //             children: <Widget>[
  //               Text('Save most probable hashes as:'),
  //               Padding(
  //                 padding: EdgeInsets.all(5),
  //                 child: LinearProgressIndicator(
  //                   value: 0.6,
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ),
  //         actions: <Widget>[
  //           FlatButton(
  //             child: Text('Cancel'),
  //             onPressed: () {
  //               Navigator.of(context).pop();
  //             },
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }

//   gotoSecondActivity(BuildContext context) async {
//     String path = await _pickFile();

//     print("Path: $path");

//     _pr = ProgressDialog(
//       context,
//       // type: ProgressDialogType.Normal,
//       // isDismissible: false,
//       // showLogs: false,
//     );

//     _pr.style(
//       message: 'Loading...',
// //      message:
// //      'Lets dump some huge text into the progress dialog and check whether it can handle the huge text. If it works then not you or me, flutter is awesome',
//       borderRadius: 5.0,
//       backgroundColor: Colors.white,
//       elevation: 10.0,
//       insetAnimCurve: Curves.easeInOut,
//       progress: 0.0,
//       progressWidgetAlignment: Alignment.center,
//       maxProgress: 100.0,
//       progressWidget: Container(
//           padding: EdgeInsets.all(8.0), child: CircularProgressIndicator()),
// //      progressTextStyle: TextStyle(
// //          color: Colors.black, fontSize: 13.0, fontWeight: FontWeight.w400),
// //      messageTextStyle: TextStyle(
// //          color: Colors.black, fontSize: 19.0, fontWeight: FontWeight.w600),
//     );

//     await _pr.show();

//     //String res = await Calc.start((msg) => onProgress(msg))};
//     String res = await Calc.start(onProgress, path, grid_size, n_sections);

//     _pr.hide().whenComplete(() {
//       //print("Result: $res");
//       Navigator.push(
//         context,
//         MaterialPageRoute(
//           builder: (context) => ResultPage(
//             home: this,
//             title: 'title',
//           ),
//         ),
//       );

//       print(_pr.isShowing());
//     });

//     double percentage = 0.0;

// //    Future.delayed(Duration(seconds: 1)).then((onvalue) {
// //      percentage = percentage + 30.0;
// //      print(percentage);
// //
// //      pr.update(
// //        progress: percentage,
// //        message: "Parsing...",
// ////        progressWidget: Container(
// ////            padding: EdgeInsets.all(8.0),
// ////            child: CircularProgressIndicator()),
// //        maxProgress: 100.0,
// ////        progressTextStyle: TextStyle(
// ////            color: Colors.black,
// ////            fontSize: 13.0,
// ////            fontWeight: FontWeight.w400),
// ////        messageTextStyle: TextStyle(
// ////            color: Colors.black,
// ////            fontSize: 19.0,
// ////            fontWeight: FontWeight.w600),
// //      );
// //      Future.delayed(Duration(seconds: 1)).then((value) {
// //        percentage = percentage + 30.0;
// //        pr.update(
// //            progress: percentage, message: "Processing...");
// //        print(percentage);
// //        Future.delayed(Duration(seconds: 1)).then((value) {
// //          percentage = percentage + 30.0;
// //          pr.update(progress: percentage, message: "Generating hashes...");
// //          print(percentage);
// //
// //          Future.delayed(Duration(seconds: 1)).then((value) {
// //            pr.hide().whenComplete(() {
// //              //print("Result: $res");
// //              Navigator.push(
// //                context,
// //                MaterialPageRoute(builder: (context) =>  ResultPage(home: this)),
// //              );
// //
// //              print(pr.isShowing());
// //            });
// //            percentage = 0.0;
// //          });
// //        });
// //      });
// //    });

//     _result = res.split("\n");

//     //_process(context);

// //    //print("Result: $res");
// //    Navigator.push(
// //      context,
// //      MaterialPageRoute(builder: (context) =>  ResultPage(home: this)),
// //    );
//   }

  gotoCmpPage(BuildContext context) async {
    //String res = await Calc.start((msg) => onProgress(msg))};
    //await Calc.start(onProgress);

    //print("Result: $res");
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => CmpPage(
                home: this,
                title: '',
              )),
    );
  }

//  gotoSettingsActivity(BuildContext context){
//
//    Navigator.push(
//      context,
//      MaterialPageRoute(builder: (context) =>  SettingsPage()),
//    );
//  }

  void openAppSettings(BuildContext context) {
    // Navigator.of(context).push(MaterialPageRoute(
    //   builder: (context) => AppSettings(home: this),
    // ));
  }

  void share(BuildContext context, data) {
    //Share.share('check out my website https://example.com');

    Share.share(data.join("\n"));
  }

  void deleteHashes(String key) {
    // hs.remove(key);
    setState(() {});
  }

  // Future<String> _pickFile() async {
  //   FilePickerResult? result = await FilePicker.platform.pickFiles();

  //   if (result != null) {
  //     File file = File(result.files.single.path!);
  //   } else {
  //     // User canceled the picker
  //   }
  // }

  // Future<String> _pickFile() async {
  //   String result;
  //   try {
  //     setState(() {
  //       _isBusy = true;
  //       _currentFile = null;
  //     });
  //     final params = OpenFileDialogParams(
  //       dialogType: _dialogType,
  //       sourceType: _sourceType,
  //       allowEditing: _allowEditing,
  //       localOnly: _localOnly,
  //     );
  //     result = await FlutterFileDialog.pickFile(params: params);
  //     print(result);
  //   } on PlatformException catch (e) {
  //     print(e);
  //   } finally {
  //     setState(() {
  //       if (result != null) {
  //         _currentFile = File(result);
  //       } else {
  //         _currentFile = null;
  //       }
  //       _isBusy = false;
  //     });
  //   }
  //   return result;
  // }

  // Future<void> _saveFile() async {
  //   String result;
  //   try {
  //     setState(() {
  //       _isBusy = true;
  //     });
  //     final params = SaveFileDialogParams(
  //         sourceFilePath: _currentFile.path, localOnly: _localOnly);
  //     result = await FlutterFileDialog.saveFile(params: params);
  //     print(result);
  //   } on PlatformException catch (e) {
  //     print(e);
  //   } finally {
  //     setState(() {
  //       _savedFilePath = result ?? _savedFilePath;
  //       _isBusy = false;
  //     });
  //   }
  // }

  Future<void> saveHashes(String name, List<String> hashes) async {
    String result;
    try {
      setState(() {
        _isBusy = true;
      });

//      final params = SaveFileDialogParams(
//          sourceFilePath: _currentFile.path, localOnly: _localOnly);
//      result = await FlutterFileDialog.saveFile(params: params);
//      print(result);

      HashesModel hashObj = HashesModel(
        name: name,
        stamp: DateTime.now(),
        hashes: hashes,
      );

      // await hs.setObject(name, hashObj);
    } on PlatformException catch (e) {
      print(e);
    } finally {
      setState(() {
        // _savedFilePath = result ?? _savedFilePath;
        _isBusy = false;
      });
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
//        leading: IconButton(
//          icon: Icon(Icons.menu),
//          tooltip: 'Navigation menu',
//          onPressed: null,
//        ),
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            //Text(widget.title),
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
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
//        child: Column(
//          // Column is also a layout widget. It takes a list of children and
//          // arranges them vertically. By default, it sizes itself to fit its
//          // children horizontally, and tries to be as tall as its parent.
//          //
//          // Invoke "debug painting" (press "p" in the console, choose the
//          // "Toggle Debug Paint" action from the Flutter Inspector in Android
//          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
//          // to see the wireframe for each widget.
//          //
//          // Column has various properties to control how it sizes itself and
//          // how it positions its children. Here we use mainAxisAlignment to
//          // center the children vertically; the main axis here is the vertical
//          // axis because Columns are vertical (the cross axis would be
//          // horizontal).
//          mainAxisAlignment: MainAxisAlignment.center,
//          children: <Widget>[
//            Text(
//              'You have pushed the button this many times:',
//            ),
//            Text(
//              '$_counter',
//              style: Theme.of(context).textTheme.headline4,
//            ),
//            RaisedButton( //                         <--- Button
//              child: Text('Button'),
//              onPressed: () {
//                gotoSecondActivity(context);
//              },
//            ),
//          ],
//        ),
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 15, top: 15, right: 15, bottom: 5),
              child: Column(children: <Widget>[
                Text(
                    "Add your object's 3D model from file or scan it by camera and get a unique Hash ID."),
                Text(
                    "In order to recognize your object add a new one object's 3D model or scan it again."),
              ]),
            ),
            Container(
              padding: EdgeInsets.all(15.0),
              width: 400,
              //height: 400,
              child: Center(
                  child: Column(
                children: <Widget>[
                  SizedBox(
                    width: 400,
                    child: RaisedButton.icon(
                      icon: Icon(Icons.folder_open),
                      label: Text('Get from file'),
                      onPressed: () async {
                        // await gotoSecondActivity(context);
                      },
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                    width: 400,
                    child: RaisedButton.icon(
                      icon: Icon(Icons.camera_alt),
                      label: Text('Scan by camera'),
                      onPressed: () async {
                        // await gotoSecondActivity(context);
                      },
                    ),
                  ),
                ],
              )),
            ),
            // Container(
            //   padding: new EdgeInsets.all(.0),
            //   height: 300, //Your custom height
            //   child: new Container(
            //     alignment: Alignment.topCenter,
            //     child: ListView.builder(
            //       shrinkWrap: true,
            //       physics: AlwaysScrollableScrollPhysics(),
            //       itemCount: hs.length + 1,
            //       itemBuilder: _buildCards,
            //     ),
            //   ),
            // ),
          ],
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
                openAppSettings(context);
              },
              //title: Container(), //Text("Delete"),
            ),
          ],
        ),
      ),
    );

//      floatingActionButton: FloatingActionButton(
//        onPressed: _incrementCounter,
//        tooltip: 'Increment',
//        child: Icon(Icons.add),
//      ),
//      floatingActionButton: FloatingActionButton(
//        onPressed: () {gotoSecondActivity(context); },
//        tooltip: 'Go second screen',
//        child: Icon(Icons.add),
//      ), // This trailing comma makes auto-formatting nicer for build methods.
//    );
  }

  Card _buildCards(BuildContext context, int index) {
    if (index == 0) {
      return Card(
        child: new Container(
          padding: new EdgeInsets.all(1.0),
          child: new Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                    'Use \'Generate from file\' if you\'ve got already a 3D model of your object'),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding:
                      EdgeInsets.only(left: 10, top: 0, right: 0, bottom: 10),
                  child: Row(
                    children: [
                      Icon(
                        Icons.help_center,
                        color: Colors.black,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      MarkdownBody(
                        data: "### [How to use 3DPass](http://habr.com)",
                        onTapLink: (String text, String? href, String title) {
                          print("tapped: text=$text href=$href");
//                           },
                          // print("tapped: $url");
                          // _launchURL(url);
                          //showOverlapPage();
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    } else {
      // HashesModel hashe = hs.getAt(index - 1)!;

      return Card(
          child: new Container(
        padding: new EdgeInsets.all(16.0),
        child: Row(children: <Widget>[
          Column(
            children: <Widget>[
              //                new Text('Object <scan 1>'),
              //                new Text('2020-09-21 11:55')
              // Text(hashe.name),
              // Text(hashe.stamp.toString()),
            ],
          ),
          Spacer(),
          _cardPopupMenu(index - 1),
//                  Container(
//                      child: IconButton(
//                        icon: Icon(Icons.more_vert, color: Colors.grey),
//                        onPressed: () => _cardPopupMenu(),
//                      )
//                  ),
        ]),
      ));
    }
  }

  Widget _cardPopupMenu(int index) {
    return PopupMenuButton(
        icon: Icon(Icons.more_vert, color: Colors.grey),
        onSelected: (value) {
          print("$value, $index");
          // HashesModel data = hs.getAt(index)!; // TODO null check is required

          switch (value) {
            case 1:
              // share(context, data.hashes);
              break;
            case 2:
              // deleteHashes(data.name);
              break;
          }
        },
        itemBuilder: (context) => [
              PopupMenuItem(
                  value: 1,
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(2, 2, 8, 2),
                        child: Icon(Icons.share, color: Colors.grey),
                      ),
                      Text('Share')
                    ],
                  )),
              PopupMenuItem(
                  value: 2,
                  child: Row(
                    children: <Widget>[
                      Padding(
                          padding: const EdgeInsets.fromLTRB(2, 2, 8, 2),
                          child: Icon(Icons.delete, color: Colors.grey)),
                      Text('Delete')
                    ],
                  ))
            ]);
  }
}
