import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:threedpass/core/widgets/progress_indicator/progress_indicator.dart';
import 'package:threedpass/features/legacy_preview/poscan_object_preview.dart';
import 'package:threedpass/features/poscan_objects_query/domain/entities/uploaded_object.dart';
import 'package:threedpass/features/poscan_objects_query/domain/usecase/get_object_content.dart';
import 'package:threedpass/features/preview/preview_page/presentation/widgets/preview_page_body.dart';
import 'package:threedpass/setup.dart';

class PoscanObjPreviewWrapper extends StatefulWidget {
  final int id;

  const PoscanObjPreviewWrapper({
    required this.id,
    super.key,
  });

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<PoscanObjPreviewWrapper> {
  ObjectContent? objectContent = null;

  @override
  void initState() {
    getIt<GetObjectContent>().safeCall(
      params: widget.id,
      onError: (final e, final st) => Fluttertoast.showToast(
        msg: 'Failed to load object id: ${widget.id}. $e',
        toastLength: Toast.LENGTH_LONG,
      ),
      onSuccess: (final value) {
        if (mounted) setState(() => objectContent = value);
      },
    );
    super.initState();
  }

  @override
  Widget build(final BuildContext context) {
    final size = Size(
      MediaQuery.of(context).size.width - 16 * 4,
      PreviewPageBody.objectPreviewHeight,
    );
    return SizedBox(
      width: size.width,
      height: size.height,
      child: objectContent != null
          ? PoscanObjectPreview(
              uploadedObject: objectContent!,
              size: size,
            )
          : D3pProgressIndicator(size: 16),
    );
  }
}
