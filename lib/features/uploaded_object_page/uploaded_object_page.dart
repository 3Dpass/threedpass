import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:threedpass/core/widgets/d3p_scaffold.dart';
import 'package:threedpass/core/widgets/paddings.dart';
import 'package:threedpass/core/widgets/text/d3p_body_medium_text.dart';
import 'package:threedpass/features/poscan_objects_query/domain/entities/uploaded_object.dart';
import 'package:threedpass/features/uploaded_object_page/widgets/raw_uploaded_object_content.dart';
import 'package:threedpass/features/uploaded_object_page/widgets/snapshot_connected_to_uploaded.dart';
import 'package:threedpass/features/uploaded_object_page/widgets/uploaded_object_id_text.dart';
import 'package:threedpass/features/uploaded_object_page/widgets/uploaded_object_status_text.dart';

@RoutePage()
class UploadedObjectPage extends StatelessWidget {
  const UploadedObjectPage({required this.uploadedObject, super.key});

  final UploadedObject uploadedObject;

  @override
  Widget build(final BuildContext context) {
    return D3pScaffold(
      appbarTitle: 'uploaded_object_title',
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBoxH16(),
              UploadedObjectIdText(uploadedObject: uploadedObject),
              const SizedBoxH16(),
              UploadedObjectStatusText(uploadedObject: uploadedObject),
              SnapshotConnectedToUploaded(
                uploadedObject: uploadedObject,
                topPadding: 16,
              ),
              const SizedBoxH24(),
              const D3pBodyMediumText('Raw:'), // TODO LOCALIZE
              RawUploadedObjectContent(uploadedObject: uploadedObject),
            ],
          ),
        ),
      ),
    );
  }
}
