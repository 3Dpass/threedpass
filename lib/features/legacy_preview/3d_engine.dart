// ignore_for_file: prefer-first
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:threedpass/features/legacy_preview/no_scroll_wrapper.dart';
import 'package:vector_math/vector_math.dart' as math;

import 'model.dart';
import 'utils.dart';

class RenderParams {
  final bool backfaceCulling;

  const RenderParams({
    this.backfaceCulling = true,
  });
}

class Object3D extends StatefulWidget {
  final Size size;
  final String value;
  // final double zoom;
  // final double scale;
  final Model model;
  final RenderParams params;

  Object3D({
    required this.size,
    required this.value,
    this.params = const RenderParams(),
    super.key,
  }) : model = Model()
          ..loadFromString(value)
          ..scale((min(size.width, size.height) - 32) / 2);

  @override
  _Object3DState createState() => _Object3DState();
}

class _Object3DState extends State<Object3D> {
  double angleX = 0.0;
  double angleY = 0.0;
  double angleZ = 0.0;
  double zoom = 0.0;

  final Map<String, Color> colorCache = {};

  void _dragX(final Offset delta) {
    angleX += delta.dy;
    if (angleX > 360) {
      angleX = angleX - 360;
    } else if (angleX < 0) {
      angleX = 360 - angleX;
    }
  }

  void _dragY(final Offset delta) {
    angleY += delta.dx;
    if (angleY > 360) {
      angleY = angleY - 360;
    } else if (angleY < 0) {
      angleY = 360 - angleY;
    }
  }

  @override
  Widget build(final BuildContext context) {
    return NoScrollWrapper(
      size: widget.size,
      child: Listener(
        onPointerMove: onPointerMove,
        child: CustomPaint(
          painter: _ObjectPainter(
            size: widget.size,
            model: widget.model,
            params: widget.params,
            colorCache: colorCache,
            angleX: angleX,
            angleY: angleY,
            angleZ: angleZ,
            // zoom: widget.zoom,
          ),
          size: widget.size,
        ),
      ),
    );
  }

  void onPointerMove(final PointerMoveEvent moveEvent) {
    setState(() {
      _dragX(moveEvent.delta);
      _dragY(moveEvent.delta);
      // print(
      //     'Set state. moveX: ${moveEvent.delta.dx}, moveY: ${moveEvent.delta.dy}. Diff: ${now.difference(lastUpdate).inMilliseconds}');
    });
  }
}

/*
 *  To render our 3D model we'll need to implement the CustomPainter interface and
 *  handle drawing to the canvas ourselves.
 *  https://api.flutter.dev/flutter/rendering/CustomPainter-class.html
 */
class _ObjectPainter extends CustomPainter {
  // final double _viewPortX;
  // final double _viewPortY;
  static const double zoom = 1.0;

  final math.Vector3 camera;
  final math.Vector3 light;

  final double angleX;
  final double angleY;
  final double angleZ;

  final Size size;

  List<math.Vector3> verts;

  final Model model;
  final RenderParams params;

  // The same paint draws paths on canvas
  final Paint reusablePaint;
  // The same matrix to transform the vertices
  final math.Matrix4 reusableTrans;

  final Map<String, Color> colorCache;

  // Camera at origin
  static final viewDirection = math.Vector3(0, 0, 1);
  static const color = Color.fromRGBO(127, 127, 127, 1);

  _ObjectPainter({
    required this.size,
    required this.model,
    required this.params,
    required this.colorCache,
    required this.angleX,
    required this.angleY,
    required this.angleZ,
    // required this.zoom,
  })  : this.camera = math.Vector3(0.0, 0.0, 0.0),
        light = math.Vector3(0.0, 0.0, 100.0),
        verts = <math.Vector3>[],
        reusablePaint = Paint()..style = PaintingStyle.fill,
        // _viewPortX = size.width / 2,
        // _viewPortY = size.height / 2,
        reusableTrans =
            math.Matrix4.translationValues(size.width / 2, size.height / 2, 1)
              ..scale(zoom, -zoom)
              ..rotateX(Utils.degreeToRadian(angleX))
              ..rotateY(Utils.degreeToRadian(angleY))
              ..rotateZ(Utils.degreeToRadian(angleZ));

  /*
   *  We use a 4x4 matrix to perform our rotation, translation and scaling in
   *  a single pass.
   *  https://www.euclideanspace.com/maths/geometry/affine/matrix4x4/index.htm
   */
  math.Vector3 _calcVertex(final math.Vector3 vertex) {
    return reusableTrans.transform3(vertex);
  }

  double dp(final double val, final int places) {
    final num mod = pow(10.0, places);
    return (val * mod).round().toDouble() / mod;
  }

  Color computeShadedColor(final Color baseColor, final double brightness) {
    final roundedBrightness = dp(brightness, 3);
    final key = '${baseColor.value}_${roundedBrightness}';
    // print('Color: ${baseColor.value}');
    final cachedColor = colorCache[key];
    if (cachedColor != null) {
      return cachedColor;
    }
    final r = (roundedBrightness * baseColor.red).toInt();
    final g = (roundedBrightness * baseColor.green).toInt();
    final b = (roundedBrightness * baseColor.blue).toInt();
    final newColor = Color.fromARGB(255, r, g, b);
    colorCache[key] = newColor;
    return newColor;
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
    // final r = (brightness * color.red).toInt();
    // final g = (brightness * color.green).toInt();
    // final b = (brightness * color.blue).toInt();
    // reusablePaint.color = Color.fromARGB(255, r, g, b);
    final shadedColor = computeShadedColor(color, brightness);
    reusablePaint.color = shadedColor;

    // Paint the face
    final path = Path();
    path.moveTo(v1.x, v1.y);
    path.lineTo(v2.x, v2.y);
    path.lineTo(v3.x, v3.y);
    path.lineTo(v1.x, v1.y);
    path.close();
    canvas.drawPath(path, reusablePaint);
  }

  /*
   *  Backface culling.  If the polygon is facing the camera, then it is visible
   */
  bool backfaceCullingSkip(
    final math.Vector3 v1,
    final math.Vector3 v2,
    final math.Vector3 v3,
  ) {
    if (!params.backfaceCulling) {
      return false;
    }

    // Calculate the surface normal
    final normalVector = Utils.normalVector3(v1, v2, v3);

    // Backface culling: skip if normal points away from the camera
    final dotProduct = normalVector.dot(viewDirection);
    return dotProduct <= 0;
  }

  /*
   *  Override the paint method.  Rotate the verticies, sort and finally render
   *  our 3D model.
   */
  @override
  void paint(final Canvas canvas, final Size size) {
    // Rotate and translate the vertices
    verts = model.verts
        .map((final v) => _calcVertex(math.Vector3.copy(v)))
        .toList();

    // Sort
    final sorted = <Map<String, dynamic>>[];
    for (var i = 0; i < model.faces.length; i++) {
      final face = model.faces[i];
      // Reference the rotated vertices
      final v1 = verts[face[0] - 1];
      final v2 = verts[face[1] - 1];
      final v3 = verts[face[2] - 1];

      if (backfaceCullingSkip(v1, v2, v3)) {
        continue;
      }

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
      // final color = model.colors[sorted[i]["index"] as int];
      _drawFace(canvas, face, color);
    }

    // print(' Keys: ${colorCache.length}');
  }

  /*
   *  We only want to repaint the canvas when the scene has changed.
   */
  @override
  bool shouldRepaint(final _ObjectPainter old) {
    return true;
  }
}
