import 'package:flutter/material.dart';
import 'package:flutter_cube/flutter_cube.dart';

class Experimental extends StatelessWidget {
  const Experimental({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Cube(
          onSceneCreated: (Scene scene) {
            scene.world.add(Object(fileName: 'assets/scan1_low.obj'));
          },
        ),
      ),
    );
  }
}
