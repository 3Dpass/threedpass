import 'package:flutter/material.dart';

class CalcHashLoadingWidget extends StatelessWidget {
  const CalcHashLoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Row(
        children: [
          const CircularProgressIndicator(),
          Flexible(
            child: Container(
              margin: const EdgeInsets.only(left: 16),
              child: const Text("Calculating hashes..."),
            ),
          ),
        ],
      ),
    );
  }
}
