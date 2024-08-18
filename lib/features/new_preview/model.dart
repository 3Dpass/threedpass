// ignore_for_file: prefer-first
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:vector_math/vector_math.dart';

/*
 *  A very simple Wavefront .OBJ parser.
 *  https://en.wikipedia.org/wiki/Wavefront_.obj_file
 */
class Model {
  final List<Vector3> verts;
  final List<List<int>> faces;

  final List<Color> colors;
  Map<String, Color> materials;

  /* 
   *  Converts normalised color values to a Color()
   */
  static Color _toRGBA(final double r, final double g, final double b) {
    return Color.fromRGBO(
      (r * 255).toInt(),
      (g * 255).toInt(),
      (b * 255).toInt(),
      1,
    );
  }

  Model()
      : verts = <Vector3>[],
        faces = <List<int>>[],
        colors = <Color>[],
        materials = {
          "frontal": _toRGBA(0.848100, 0.607500, 1.000000),
          "occipital": _toRGBA(1.000000, 0.572600, 0.392400),
          "parietal": _toRGBA(0.379700, 0.830900, 1.000000),
          "temporal": _toRGBA(1.000000, 0.930700, 0.468300),
          "cerebellum": _toRGBA(0.506300, 1.000000, 0.598200),
          "stem": _toRGBA(0.500000, 0.500000, 0.500000),
        };

  void scale(final double value) {
    double globalMaxCoord = 0.0;
    verts.forEach((final vert) {
      final maxCoord = max(max(vert.x, vert.y), vert.z);
      if (maxCoord > globalMaxCoord) {
        globalMaxCoord = maxCoord;
      }
    });
    final scaleValue = value / globalMaxCoord;
    verts.forEach((final vert) {
      vert.scale(scaleValue);
    });
  }

  /*
   *  Parses the object from a string.
   */
  void loadFromString(final String string) {
    // String material;
    final List<String> lines = string.split("\n");
    lines.forEach((final line) {
      // Parse a vertex
      if (line.startsWith("v ")) {
        final values = line.substring(2).split(" ");
        verts.add(
          Vector3(
            double.parse(values[0]),
            double.parse(values[1]),
            double.parse(values[2]),
          ),
        );
      }
      // Parse a material reference
      // else if (line.startsWith("usemtl ")) {
      //   // material = line.substring(7);
      // }
      // Parse a face
      else if (line.startsWith("f ")) {
        final values = line.substring(2).split(" ");
        faces.add(
          List.from(<int>[
            int.parse(values[0].split("/")[0]),
            int.parse(values[1].split("/")[0]),
            int.parse(values[2].split("/")[0]),
          ]),
        );
        //colors.add(materials[material]);
        colors.add(_toRGBA(0.5, 0.5, 0.5));
      }
    });
  }
}
