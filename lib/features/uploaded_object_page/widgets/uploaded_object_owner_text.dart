import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:threedpass/core/utils/formatters.dart';
import 'package:threedpass/core/widgets/other/fast_rich_text.dart';
import 'package:threedpass/features/poscan_objects_query/domain/entities/uploaded_object.dart';

class UploadedObjectOwnerText extends StatelessWidget {
  const UploadedObjectOwnerText({
    required this.uploadedObject,
    this.short = false,
    super.key,
  });

  final UploadedObject uploadedObject;
  final bool short;

  @override
  Widget build(final BuildContext context) {
    return FastRichText(
      mainText: short
          ? Formatters.shorterAddress(uploadedObject.owner)
          : uploadedObject.owner,
      secondaryText: 'uploaded_object_owner'.tr(),
    );
  }
}
