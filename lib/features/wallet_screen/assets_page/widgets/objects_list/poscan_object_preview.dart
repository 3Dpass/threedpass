import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:rust_lzss/rust_lzss.dart';
import 'package:threedpass/core/widgets/progress_indicator/progress_indicator.dart';
import 'package:threedpass/features/poscan_objects_query/domain/entities/uploaded_object.dart';

class PoscanObjectPreview extends StatefulWidget {
  final UploadedObject uploadedObject;

  const PoscanObjectPreview({
    required this.uploadedObject,
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
    content = greet(name: 'PLEASE_WAIT');
    setState(() {
      isLoaded = true;
    });
  }

  @override
  Widget build(final BuildContext context) {
    if (isLoaded) {
      return Text(content);
    } else {
      return const D3pProgressIndicator(size: 24);
    }
  }
}
