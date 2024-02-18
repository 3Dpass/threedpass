import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:threedpass/core/utils/formatters.dart';
import 'package:threedpass/core/widgets/buttons/clickable_card.dart';
import 'package:threedpass/core/widgets/paddings.dart';
import 'package:threedpass/core/widgets/utc_time.dart';
import 'package:threedpass/features/poscan_objects_query/domain/entities/uploaded_object.dart';
import 'package:threedpass/features/uploaded_object_page/widgets/snapshot_connected_to_uploaded.dart';
import 'package:threedpass/features/uploaded_object_page/widgets/uploaded_object_id_text.dart';
import 'package:threedpass/features/uploaded_object_page/widgets/uploaded_object_owner_text.dart';
import 'package:threedpass/features/uploaded_object_page/widgets/uploaded_object_status_text.dart';
import 'package:threedpass/router/router.gr.dart';

class ObjectsListItem extends StatelessWidget {
  const ObjectsListItem({required this.uploadedObject, super.key});

  final UploadedObject uploadedObject;

  @override
  Widget build(final BuildContext context) {
    return ClickableCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          UploadedObjectIdText(uploadedObject: uploadedObject),
          const SizedBoxH8(),
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              UploadedObjectStatusText(uploadedObject: uploadedObject),
              const SizedBox(width: 8),
              UTCTime(
                dateTime: uploadedObject.statusDateUTC,
                formatter: Fmt.shortDateFormat,
              ),
            ],
          ),
          const SizedBoxH8(),
          UploadedObjectOwnerText(
            uploadedObject: uploadedObject,
            short: true,
          ),
          const SizedBoxH8(),
          SnapshotConnectedToUploaded(
            uploadedObject: uploadedObject,
            topPadding: 8,
          ),
        ],
      ),
      onTap: () => context.router.push(
        UploadedObjectRoute(uploadedObject: uploadedObject),
      ),
    );
  }
}
