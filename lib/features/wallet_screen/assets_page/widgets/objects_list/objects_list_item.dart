import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:threedpass/core/utils/formatters.dart';
import 'package:threedpass/core/widgets/buttons/clickable_card.dart';
import 'package:threedpass/core/widgets/paddings.dart';
import 'package:threedpass/core/widgets/utc_time.dart';
import 'package:threedpass/features/legacy_preview/poscan_object_preview.dart';
import 'package:threedpass/features/poscan_objects_query/domain/entities/uploaded_object.dart';
import 'package:threedpass/features/preview/preview_page/presentation/widgets/preview_page_body.dart';
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
          PoscanObjectPreview(
            uploadedObject: uploadedObject,
            size: Size(
              MediaQuery.of(context).size.width - 16 * 4,
              PreviewPageBody.objectPreviewHeight,
            ),
          ),
          UploadedObjectIdText(uploadedObject: uploadedObject),
          const H8(),
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
          const H8(),
          UploadedObjectOwnerText(
            uploadedObject: uploadedObject,
            short: true,
          ),
          // TODO? Links found text
          // const H8(),
          // Text('TODO LINKS FOUND'),
          // SnapshotConnectedToUploaded(
          //   uploadedObject: uploadedObject,
          //   topPadding: 8,
          //   isOnlyText: true,
          // ),
        ],
      ),
      onTap: () => context.router.push(
        UploadedObjectRoute(uploadedObject: uploadedObject),
      ),
    );
  }
}
