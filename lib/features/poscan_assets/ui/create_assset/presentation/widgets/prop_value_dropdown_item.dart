import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:threedpass/core/widgets/other/fast_rich_text.dart';
import 'package:threedpass/features/poscan_objects_query/domain/entities/prop_value.dart';
import 'package:threedpass/features/poscan_putobject/presentation/widgets/property_max_value_text.dart';

class PropValueDropdownItem extends StatelessWidget {
  final PropValue propValue;

  const PropValueDropdownItem(this.propValue, {super.key});

  @override
  Widget build(final BuildContext context) {
    return Row(
      children: [
        FastRichText(
          mainText: propValue.propIdx.toString(),
          secondaryText: 'property_id_label'.tr(),
        ),
        const SizedBox(width: 16),
        PropertyMaxValueText(propValue),
      ],
    );
  }
}
