import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_cube/flutter_cube.dart';
import 'package:threedpass/features/hashes_list/domain/entities/hashes_model.dart';

class ObjectPreview extends StatelessWidget {
  const ObjectPreview({required this.hashesModel});

  final HashesModel hashesModel;

  SnackBar errorSnackBar() => SnackBar(
        content: Text(
          '.obj file for "${hashesModel.name}" does not exists. Path: ${hashesModel.externalPathToObj}',
        ),
      );

  bool _objectFileExists() {
    return hashesModel.externalPathToObj != null &&
        File(hashesModel.externalPathToObj!).existsSync();
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
                fileName: hashesModel.externalPathToObj!,
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
