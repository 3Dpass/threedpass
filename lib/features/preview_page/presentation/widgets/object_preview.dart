import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_gl/flutter_gl.dart';
import 'package:three_dart/three3d/objects/index.dart';
import 'package:three_dart/three_dart.dart' as THREE;
import 'package:threedpass/features/hashes_list/domain/entities/snapshot.dart';

class ObjectPreview extends StatefulWidget {
  const ObjectPreview({
    Key? key,
    required this.snapshot,
  }) : super(key: key);

  final Snapshot snapshot;
  
  @override
  State<StatefulWidget> createState() => _State();

}

class _State extends State<ObjectPreview>{


 late final  Size screenSize ;
 late final double dpr; // Device Pixel Ratio
 bool isRendered = false;

 final FlutterGlPlugin three3dRender = FlutterGlPlugin();

  @override
  void initState() {
    _init();
    super.initState();
  }

  Future<void> _init()async{
   final mqd = MediaQuery.of(context);

    screenSize = mqd.size;
    dpr = mqd.devicePixelRatio;

    Map<String, dynamic> _options = {
      "antialias": true,
      "alpha": false,
      "width": screenSize.width.toInt(),
      "height": screenSize.height.toInt(),
      "dpr": dpr,
    };

    await three3dRender.initialize(options: _options);

    // https://github.com/wasabia/three_dart/blob/c5b4e36c7a6eb489145252a6a52b039344f021be/example/lib/webgl_loader_obj.dart#L72
    Future.delayed(const Duration(milliseconds: 100), () async {
      await three3dRender.prepareContext();

      // initScene();
    });
  }

  // @override
  // void didChangeDependencies() {
  //   // TODO: implement didChangeDependencies
  //   super.didChangeDependencies();
  // }

  

  SnackBar errorSnackBar() => SnackBar(
        content: Text(
          '.obj file for "${widget.snapshot.name}" does not exists. Path: ${widget.snapshot.externalPathToObj}',
        ),
      );

  bool _objectFileExists() {
    return widget.snapshot.externalPathToObj != null &&
        File(widget.snapshot.externalPathToObj!).existsSync();
  }

  @override
  Widget build(BuildContext context) {
    return isRendered?SizedBox():Center(child: CircularProgressIndicator(),);

     

    
//     final camera =  THREE.PerspectiveCamera( 40, 1, 0.1, 10 );
// camera.position.z = 3;

// final scene =  THREE.Scene();
//  camera.lookAt(scene.position);

// scene.background = THREE.Color(1.0, 1.0, 1.0);
// scene.add(  THREE.AmbientLight( 0x222244, null ) );

// var geometryCylinder =  THREE.CylinderGeometry( 0.5, 0.5, 1, 32 );
// var materialCylinder =  THREE.MeshPhongMaterial( { "color": 0xff0000 } );

// final mesh =  THREE.Mesh( geometryCylinder, materialCylinder );
// scene.add( mesh );

//     return Container(
//       color: Colors.grey,
//       width: MediaQuery.of(context).size.width - 16 * 2,
//       height: 150.0,

//       // child: Cube(
//       //   // TODO Use Three_dart for this
//       //   // ignore: prefer-extracting-callbacks
//       //   onSceneCreated: (Scene scene) {
//       //     // scene.camera.zoom = ;
//       //     scene.camera.zoom = 5;
//       //     if (_objectFileExists()) {
//       //       scene.world.add(
//       //         Object(
//       //           fileName: snapshot.externalPathToObj!,
//       //           isAsset: false,
//       //         ),
//       //       );
//       //     } else {
//       //       ScaffoldMessenger.of(context).showSnackBar(errorSnackBar());
//       //     }
//       //   },
//       // ),
//     );
  }
}
