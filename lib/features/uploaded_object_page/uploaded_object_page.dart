import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:threedpass/core/utils/formatters.dart';
import 'package:threedpass/core/widgets/d3p_scaffold.dart';
import 'package:threedpass/core/widgets/other/fast_rich_text.dart';
import 'package:threedpass/core/widgets/paddings.dart';
import 'package:threedpass/core/widgets/utc_time.dart';
import 'package:threedpass/features/hashes_list/domain/entities/snapshot.dart';
import 'package:threedpass/features/legacy_preview/poscan_object_preview.dart';
import 'package:threedpass/features/poscan_assets/domain/entities/poscan_token_data.dart';
import 'package:threedpass/features/poscan_objects_query/domain/entities/uploaded_object.dart';
import 'package:threedpass/features/preview/preview_page/presentation/widgets/preview_page_body.dart';
import 'package:threedpass/features/uploaded_object_page/widgets/links_data_wapper.dart';
import 'package:threedpass/features/uploaded_object_page/widgets/uploaded_object_id_text.dart';
import 'package:threedpass/features/uploaded_object_page/widgets/uploaded_object_links.dart';
import 'package:threedpass/features/uploaded_object_page/widgets/uploaded_object_owner_text.dart';
import 'package:threedpass/features/uploaded_object_page/widgets/uploaded_object_status_text.dart';

class UploadedObjectPage extends StatelessWidget {
  const UploadedObjectPage({required this.uploadedObject, super.key});

  final UploadedObject uploadedObject;

  @override
  Widget build(final BuildContext context) {
    return D3pScaffold(
      appBarTitle: 'uploaded_object_title',
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: [
          const H16(),
          PoscanObjectPreview(
            uploadedObject: uploadedObject,
            size: Size(
              MediaQuery.of(context).size.width - 16 * 2,
              PreviewPageBody.objectPreviewHeight,
            ),
          ),
          const H16(),
          LinksDataWrapper(
            uploadedObject: uploadedObject,
            child: (
              final Iterable<PoscanAssetData> assets,
              final Iterable<Snapshot> snapshots,
            ) =>
                UploadedObjectLinks(
              assets: assets,
              snapshots: snapshots,
            ),
          ),
          const H16(),
          Text(
            'uploaded_object_obj_details_subtitle'.tr(),
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const H16(),
          // AssetsConnectedToUploaded(uploadedObject: uploadedObject),
          UploadedObjectIdText(uploadedObject: uploadedObject),
          const H16(),
          Row(
            children: [
              UploadedObjectStatusText(uploadedObject: uploadedObject),
              const SizedBox(width: 16),
              UTCTime(
                dateTime: uploadedObject.statusDateUTC,
                formatter: Formatters.shortDateFormat,
              ),
            ],
          ),
          const H16(),
          UploadedObjectOwnerText(uploadedObject: uploadedObject),
          const H16(),
          FastRichText(
            mainText: '\n' + uploadedObject.hashesListJoined,
            secondaryText: 'uploaded_object_hashes'.tr(),
          ),
          const H16(),
        ],
      ),
    );
  }
}
