// ignore_for_file: prefer-first
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:threedpass/features/legacy_preview/no_scroll_wrapper.dart';
import 'package:vector_math/vector_math.dart' as math;

import 'model.dart';
import 'utils.dart';

class Object3D extends StatefulWidget {
  final Size size;
  final String path;
  final double zoom;
  final double scale;

  const Object3D({
    required this.size,
    required this.path,
    required this.zoom,
    this.scale = 1.0,
    super.key,
  });

  @override
  _Object3DState createState() => _Object3DState();
}

class _Object3DState extends State<Object3D> {
  double angleX = 0.0;
  double angleY = 0.0;
  double angleZ = 0.0;
  double zoom = 0.0;

  Model? model;

  /*
   *  Load the 3D  data from a file in our /assets folder.
   */
  @override
  void initState() {
    print('D INIT STATE');
    File(widget.path).readAsString().then((final value) {
      print('D READ FILE');
      setState(() {
        model = Model();
        model!.loadFromString(value);
        model!.scale(widget.scale);
      });
    });
    super.initState();
  }

  void _dragX(final Offset delta) {
    // setState(() {
    angleX += delta.dy;
    if (angleX > 360) {
      angleX = angleX - 360;
    } else if (angleX < 0) {
      angleX = 360 - angleX;
    }
    // });
  }

  void _dragY(final Offset delta) {
    // setState(() {
    angleY += delta.dx;
    if (angleY > 360) {
      angleY = angleY - 360;
    } else if (angleY < 0) {
      angleY = 360 - angleY;
    }
    // });
  }

  @override
  Widget build(final BuildContext context) {
    if (model == null) {
      return const Text('loading');
    }
    return NoScrollWrapper(
      size: widget.size,
      child: Listener(
        onPointerMove: onPointerMove,
        child: CustomPaint(
          painter: _ObjectPainter(
            size: widget.size,
            model: model!,
            angleX: angleX,
            angleY: angleY,
            angleZ: angleZ,
            zoom: widget.zoom,
          ),
          size: widget.size,
        ),
      ),
    );
  }

  void onPointerMove(final PointerMoveEvent moveEvent) {
    // print('D SCALE UPDATE $details');
    // print('Delta ${moveEvent.delta}');
    setState(() {
      _dragX(moveEvent.delta);
      _dragY(moveEvent.delta);
    });
  }
}

/*
 *  To render our 3D model we'll need to implement the CustomPainter interface and
 *  handle drawing to the canvas ourselves.
 *  https://api.flutter.dev/flutter/rendering/CustomPainter-class.html
 */
class _ObjectPainter extends CustomPainter {
  final double _viewPortX;
  final double _viewPortY;
  final double zoom;

  final math.Vector3 camera;
  final math.Vector3 light;

  final double angleX;
  final double angleY;
  final double angleZ;

  final Size size;

  List<math.Vector3> verts;

  final Model model;

  _ObjectPainter({
    required this.size,
    required this.model,
    required this.angleX,
    required this.angleY,
    required this.angleZ,
    required this.zoom,
  })  : this.camera = math.Vector3(0.0, 0.0, 0.0),
        light = math.Vector3(0.0, 0.0, 100.0),
        verts = <math.Vector3>[],
        _viewPortX = size.width / 2,
        _viewPortY = size.height / 2;

  /*
   *  We use a 4x4 matrix to perform our rotation, translation and scaling in
   *  a single pass.
   *  https://www.euclideanspace.com/maths/geometry/affine/matrix4x4/index.htm
   */
  math.Vector3 _calcVertex(final math.Vector3 vertex) {
    final trans = math.Matrix4.translationValues(_viewPortX, _viewPortY, 1);
    trans.scale(zoom, -zoom);
    trans.rotateX(Utils.degreeToRadian(angleX));
    trans.rotateY(Utils.degreeToRadian(angleY));
    trans.rotateZ(Utils.degreeToRadian(angleZ));
    return trans.transform3(vertex);
  }

  /*
   *  Calculate the lighting and paint the polygon on the canvas.
   */
  void _drawFace(final Canvas canvas, final List<int> face, final Color color) {
    // Reference the rotated vertices
    final v1 = verts[face[0] - 1];
    final v2 = verts[face[1] - 1];
    final v3 = verts[face[2] - 1];

    // Calculate the surface normal
    final normalVector = Utils.normalVector3(v1, v2, v3);

    // Calculate the lighting
    final math.Vector3 normalizedLight = math.Vector3.copy(light).normalized();
    final jnv = math.Vector3.copy(normalVector).normalized();
    final normal = Utils.scalarMultiplication(jnv, normalizedLight);
    final brightness = normal.clamp(0.0, 1.0);

    // Assign a lighting color
    final r = (brightness * color.red).toInt();
    final g = (brightness * color.green).toInt();
    final b = (brightness * color.blue).toInt();

    final paint = Paint();
    paint.color = Color.fromARGB(255, r, g, b);
    paint.style = PaintingStyle.fill;

    // Paint the face
    final path = Path();
    path.moveTo(v1.x, v1.y);
    path.lineTo(v2.x, v2.y);
    path.lineTo(v3.x, v3.y);
    path.lineTo(v1.x, v1.y);
    path.close();
    canvas.drawPath(path, paint);
  }

  /*
   *  Override the paint method.  Rotate the verticies, sort and finally render
   *  our 3D model.
   */
  @override
  void paint(final Canvas canvas, final Size size) {
    // Rotate and translate the vertices
    verts = <math.Vector3>[];
    for (int i = 0; i < model.verts.length; i++) {
      verts.add(_calcVertex(math.Vector3.copy(model.verts[i])));
    }

    // Sort
    final sorted = <Map<String, dynamic>>[];
    for (var i = 0; i < model.faces.length; i++) {
      final face = model.faces[i];
      sorted.add(<String, dynamic>{
        "index": i,
        "order": Utils.zIndex(
          verts[face[0] - 1],
          verts[face[1] - 1],
          verts[face[2] - 1],
        ),
      });
    }
    sorted.sort(
      (final Map<dynamic, dynamic> a, final Map<dynamic, dynamic> b) =>
          (a["order"] as double).compareTo(b["order"] as double),
    );

    // Render
    for (int i = 0; i < sorted.length; i++) {
      final face = model.faces[sorted[i]["index"] as int];
      final color = model.colors[sorted[i]["index"] as int];
      _drawFace(canvas, face, color);
    }
  }

  /*
   *  We only want to repaint the canvas when the scene has changed.
   */
  @override
  bool shouldRepaint(final _ObjectPainter old) {
    return true;
  }
}
