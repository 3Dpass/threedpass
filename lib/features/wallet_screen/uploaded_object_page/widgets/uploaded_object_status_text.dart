import 'package:flutter/widgets.dart';
import 'package:threedpass/core/widgets/other/fast_rich_text.dart';
import 'package:threedpass/features/poscan_objects_query/domain/entities/uploaded_object.dart';

class UploadedObjectStatusText extends StatelessWidget {
  const UploadedObjectStatusText({required this.uploadedObject, super.key});

  final UploadedObject uploadedObject;

  @override
  Widget build(BuildContext context) {
    return FastRichText(
      mainText: uploadedObject.status,
      secondaryText: 'status: ',
    );
  }
}
