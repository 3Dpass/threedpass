// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:flutter_markdown/flutter_markdown.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:qr_flutter/qr_flutter.dart';
// import 'package:flutter_file_dialog/flutter_file_dialog.dart';

// // class SettingsPage extends StatefulWidget {
// //   SettingsPage({Key key, this.title}) : super(key: key);

// //   // This widget is the home page of your application. It is stateful, meaning
// //   // that it has a State object (defined below) that contains fields that affect
// //   // how it looks.

// //   // This class is the configuration for the state. It holds the values (in this
// //   // case the title) provided by the parent (in this case the App widget) and
// //   // used by the build method of the State. Fields in a Widget subclass are
// //   // always marked "final".

// //   final String title;

// //   @override
// //   _SettingsPageState createState() => _SettingsPageState();
// // }

// class SettingsPage extends StatelessWidget {
//   // int _counter = 0;

//   // void _incrementCounter() {
//   //   setState(() {
//   //     // This call to setState tells the Flutter framework that something has
//   //     // changed in this State, which causes it to rerun the build method below
//   //     // so that the display can reflect the updated values. If we changed
//   //     // _counter without calling setState(), then the build method would not be
//   //     // called again, and so nothing would appear to happen.
//   //     _counter++;
//   //   });
//   // }

//   goBackToPreviousScreen(BuildContext context) {
//     Navigator.pop(context);
//   }

//   _launchURL(url) async {
//     if (await canLaunch(url)) {
//       await launch(url);
//     } else {
//       throw 'Could not launch $url';
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Get a new one"),
//       ),
//       body: Center(
//         child: ListView(
//           children: [
//             // Container(
//             //     width: 200,
//             //     height: 50,
//             //     // color: Colors.green,
//             //     child: Column(
//             //       mainAxisAlignment: MainAxisAlignment.center,
//             //       crossAxisAlignment: CrossAxisAlignment.start,
//             //       children: <Widget> [
//             //         Padding(
//             //           padding: EdgeInsets.all(16),
//             //           child: MarkdownBody(
//             //             data: "Test **markdown** [like this](http://habr.com)",
//             //              onTapLink: (String text, String? href, String title) {
//             //                 print("tapped: text=$text href=$href");
//             //               },
//             //           ),
//             //         ),
//             //       ],
//             //     ),

//             //     //image: null,
//             // ),
//             Container(
//               width: 200,
//               height: 200,
//               color: Colors.green,
//               //image: null,
//             ),
//             Container(
//               width: 200,
//               height: 50,
//               color: Colors.yellow,
//               //image: null,
//             ),
//             Container(
//               padding: EdgeInsets.all(32.0),
//               //width: 400,
//               //height: 400,
//               child: Center(
//                   child: Column(
//                 children: <Widget>[
//                   SizedBox(
//                     width: 400,
//                     child: RaisedButton(
//                       child: Text('Save this object'),
//                       onPressed: () async {
//                         // String file = await FilePicker.;
//                         // print("Selected file: $file");

//                         //goBackToPreviousScreen(context);
//                       },
//                     ),
//                   ),
//                   SizedBox(
//                     width: 400,
//                     child: RaisedButton(
//                       child: Text('Remove & clear the cache'),
//                       onPressed: () {
//                         goBackToPreviousScreen(context);
//                       },
//                     ),
//                   ),
//                 ],
//               )),
//             ),
//             Container(
//               width: 200,
//               height: 100,
//               child: Row(
//                 children: <Widget>[
//                   Container(
//                     width: 100,
//                     height: 100,
//                     color: Colors.yellow,
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: <Widget>[
//                         MarkdownBody(
//                           data: "**Hash ID**\n[Show and share](show_and_share)",
//                           onTapLink: (String text, String? href, String title) {
//                             print("tapped: text=$text href=$href");
//                           },
//                         ),
//                       ],
//                     ),
//                   ),
//                   Container(
//                     width: 100,
//                     height: 100,
//                     child: QrImage(
//                       data: "1234567890",
//                       version: QrVersions.auto,
//                       size: 100.0,
//                     ),
//                     //color: Colors.blue,
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
// //      floatingActionButton: FloatingActionButton(
// //        onPressed: () { goBackToPreviousScreen(context); },
// //        tooltip: 'Back',
// //        child: Icon(Icons.arrow_back),
// //      ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
