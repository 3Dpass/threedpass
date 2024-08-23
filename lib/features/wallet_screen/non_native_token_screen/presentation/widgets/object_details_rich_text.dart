import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:super_core/super_core.dart';
import 'package:threedpass/core/widgets/layout/list_view_separated.dart';
import 'package:threedpass/core/widgets/other/fast_rich_text.dart';
import 'package:threedpass/core/widgets/other/vertical_line_left_border.dart';
import 'package:threedpass/features/poscan_assets/domain/entities/obj_details.dart';
import 'package:threedpass/features/poscan_putobject/data/default_poscan_properties.dart';
import 'package:threedpass/features/poscan_putobject/domain/entities/poscan_property.dart';

class ObjectDetailsRichText extends StatelessWidget {
  final ObjDetailsPoscanAsset? objDetails;

  const ObjectDetailsRichText({
    required this.objDetails,
    super.key,
  });

  @override
  Widget build(final BuildContext context) {
    if (objDetails != null) {
      // TODO Add a deeplink to an object
      return VerticalLineLeftBorder(
        child: ListViewSeparated(
          children: [
            FastRichText(
              mainText: objDetails!.objIdx,
              secondaryText: 'obj_details_id'.tr(),
              needSpace: true,
            ),
            _ObjectDetailsPropId(objDetails!),
            FastRichText(
              mainText: objDetails!.maxSupply,
              secondaryText: 'obj_details_prop_max_supply'.tr(),
              needSpace: true,
            ),
          ],
        ),
      );
    } else {
      return FastRichText(
        mainText: 'null',
        secondaryText: 'object_details_secondary'.tr(),
        needSpace: true,
      );
    }
  }
}

class _ObjectDetailsPropId extends StatelessWidget {
  final ObjDetailsPoscanAsset objDetails;

  const _ObjectDetailsPropId(this.objDetails);

  @override
  Widget build(final BuildContext context) {
    final prop = defaultProperties.findOrNull(
      (final PoscanProperty prop) =>
          prop.propValue.propIdx == int.parse(objDetails.propIdx),
    );

    return FastRichText(
      mainText:
          '${objDetails.propIdx} ${prop?.name != null ? '(${prop?.name})' : ''}',
      secondaryText: 'obj_details_prop_id'.tr(),
      needSpace: true,
    );
  }
}
