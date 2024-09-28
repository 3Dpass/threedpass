import 'dart:async';

import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:threedpass/core/utils/logger.dart';
import 'package:threedpass/core/widgets/progress_indicator/progress_indicator.dart';
import 'package:threedpass/features/poscan_objects_query/domain/entities/uploaded_object.dart';
import 'package:threedpass/features/poscan_objects_query/domain/usecase/get_uploaded_object.dart';
import 'package:threedpass/features/uploaded_object_page/uploaded_object_page.dart';
import 'package:threedpass/setup.dart';

@RoutePage()
class UploadedObjectWrapper extends StatefulWidget {
  const UploadedObjectWrapper({
    required this.objectId,
    this.uploadedObject,
    super.key,
  });

  final int objectId;
  final UploadedObject? uploadedObject;

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<UploadedObjectWrapper> {
  UploadedObject? uploadedObject;

  @override
  void initState() {
    super.initState();
    if (widget.uploadedObject != null) {
      uploadedObject = widget.uploadedObject;
      logger.t('Use cached uploaded object');
    } else {
      unawaited(loadObj());
    }
  }

  Future<void> loadObj() async {
    final GetUploadedObject getUploadedObject = getIt<GetUploadedObject>();

    await getUploadedObject.safeCall(
      params: widget.objectId,
      onError: (final Object e, final StackTrace st) {
        Fluttertoast.showToast(msg: 'Failed to load object. $e');
      },
      onSuccess: (final UploadedObject object) => setState(() {
        uploadedObject = object;
      }),
    );
  }

  @override
  Widget build(final BuildContext context) {
    if (uploadedObject != null) {
      return UploadedObjectPage(
        uploadedObject: uploadedObject!,
      );
    } else {
      return const Material(
        child: Center(
          child: D3pProgressIndicator(size: 32),
        ),
      );
    }
  }
}
