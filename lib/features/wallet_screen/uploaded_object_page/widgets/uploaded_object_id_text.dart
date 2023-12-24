import 'package:flutter/material.dart';
import 'package:threedpass/core/widgets/other/fast_rich_text.dart';
import 'package:threedpass/features/poscan_objects_query/domain/entities/uploaded_object.dart';

class UploadedObjectIdText extends StatelessWidget {
  const UploadedObjectIdText({required this.uploadedObject, super.key});

  final UploadedObject uploadedObject;

  @override
  Widget build(final BuildContext context) {
    return FastRichText(
      mainText: uploadedObject.id.toString(),
      secondaryText: 'id: ',
    );
  }
}
