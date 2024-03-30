import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:threedpass/core/utils/formatters.dart';
import 'package:threedpass/core/widgets/other/fast_rich_text.dart';
import 'package:threedpass/core/widgets/utc_time.dart';
import 'package:threedpass/features/poscan_objects_query/domain/entities/uploaded_object.dart';

class UploadedObjectDropdownItem extends StatelessWidget {
  final UploadedObject object;

  const UploadedObjectDropdownItem(this.object, {super.key});

  @override
  Widget build(final BuildContext context) {
    // final medium = Theme.of(context).customTextStyles.d3pBodyMedium;

    return Row(
      children: [
        FastRichText(
          mainText: object.id.toString(),
          secondaryText: 'uploaded_object_id'.tr(),
        ),
        UTCTime(
          dateTime: object.statusDateUTC,
          formatter: Fmt.shortDateFormat,
        ),
      ],
    );
  }
}
