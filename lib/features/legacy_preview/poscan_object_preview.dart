import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/widgets.dart';
import 'package:rust_lzss/rust_lzss.dart';
import 'package:threedpass/core/widgets/progress_indicator/progress_indicator.dart';
import 'package:threedpass/features/legacy_preview/3d_engine.dart';
import 'package:threedpass/features/poscan_objects_query/domain/entities/uploaded_object.dart';

class PoscanObjectPreview extends StatefulWidget {
  final UploadedObject uploadedObject;
  final Size size;

  const PoscanObjectPreview({
    required this.uploadedObject,
    required this.size,
    super.key,
  });

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<PoscanObjectPreview> {
  bool isLoaded = false;
  String content = '';

  @override
  void initState() {
    super.initState();

    unawaited(load());
  }

  Future<void> load() async {
    final encodedBytesRaw = widget.uploadedObject.obj;
    // print('EncodedRaw:');
    // print(encodedBytesRaw);
    final encodedBytes = hexToUint8List(encodedBytesRaw.substring(2));
    // print('Encoded:');
    // print(encodedBytes);
    // final encodedBytes = en
    // content = greet(name: 'PLEASE_WAIT');
    final decompressedBytes = await decompressObj(obj: encodedBytes);
    // print('Decompressed bytes:');
    // print(decompressedBytes);
    final decompressedString = String.fromCharCodes(decompressedBytes);
    // print('Decompressed string:');
    // print(decompressedString);
    content = decompressedString;
    setState(() {
      isLoaded = true;
    });
  }

  @override
  Widget build(final BuildContext context) {
    return SizedBox(
      width: widget.size.width,
      height: widget.size.height,
      child: isLoaded
          ? Object3D(
              size: widget.size,
              value: content,
            )
          : const D3pProgressIndicator(size: 24),
    );
  }
}

Uint8List hexToUint8List(final String hex) {
  if (hex.length % 2 != 0) {
    throw Exception('Odd number of hex digits');
  }
  final l = hex.length ~/ 2;
  final result = Uint8List(l);
  for (var i = 0; i < l; ++i) {
    final x = int.parse(hex.substring(2 * i, 2 * (i + 1)), radix: 16);
    if (x.isNaN) {
      throw Exception('Expected hex string');
    }
    result[i] = x;
  }
  return result;
}
