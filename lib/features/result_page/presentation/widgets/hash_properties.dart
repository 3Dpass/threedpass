import 'package:flutter/material.dart';

class HashProperties extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ListBody(
        children: <Widget>[
          Text("Strong"),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5),
            child: LinearProgressIndicator(
              value: 0.6, // TODO How is the strength of a hash counted?
            ),
          ),
          Text("Properties:"),
          Text("- 256bit"), // TODO What properties are avaliable?
        ],
      ),
    );
  }
}