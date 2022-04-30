import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_cube/flutter_cube.dart';
import 'package:threedpass/features/hashes_list/domain/entities/snapshot.dart';

class ObjectPreview extends StatelessWidget {
  const ObjectPreview({
    Key? key,
    required this.snapshot,
  }) : super(key: key);

  final Snapshot snapshot;

  SnackBar errorSnackBar() => SnackBar(
        content: Text(
          '.obj file for "${snapshot.name}" does not exists. Path: ${snapshot.externalPathToObj}',
        ),
      );

  bool _objectFileExists() {
    return snapshot.externalPathToObj != null &&
        File(snapshot.externalPathToObj!).existsSync();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      width: MediaQuery.of(context).size.width - 16 * 2,
      height: 150.0,
      child: Cube(
        onSceneCreated: (Scene scene) {
          // scene.camera.zoom = ;
          scene.camera.zoom = 5;
          if (_objectFileExists()) {
            scene.world.add(
              Object(
                fileName: snapshot.externalPathToObj!,
                isAsset: false,
              ),
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(errorSnackBar());
          }
        },
      ),
    );
  }
}
