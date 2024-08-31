import 'dart:async';
import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:threedpass/core/widgets/progress_indicator/progress_indicator.dart';
import 'package:threedpass/features/legacy_preview/3d_engine.dart';

class PreviewFromFile extends StatefulWidget {
  const PreviewFromFile({
    required this.size,
    required this.path,
    required this.zoom,
    // required this.scale,
    super.key,
  });

  final Size size;
  final String path;
  final double zoom;
  // final double scale;

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<PreviewFromFile> {
  String fileContent = '';

  @override
  void initState() {
    // print('D INIT STATE');
    unawaited(
      File(widget.path).readAsString().then((final value) {
        // print('D READ FILE');
        setState(() {
          fileContent = value;
        });
      }),
    );
    super.initState();
  }

  @override
  Widget build(final BuildContext context) {
    return SizedBox(
      width: widget.size.width,
      height: widget.size.height,
      child: fileContent.isNotEmpty
          ? Object3D(
              size: widget.size,
              value: fileContent,
              zoom: widget.zoom,
              // scale: widget.scale,
            )
          : const D3pProgressIndicator(size: 24),
    );
  }
}
