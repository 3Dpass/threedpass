import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:threedpass/core/theme/d3p_special_styles.dart';

class TableHeader extends StatelessWidget {
  const TableHeader({super.key});

  @override
  Widget build(final BuildContext context) {
    final customStyles = Theme.of(context).customTextStyles;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Rank'.tr(),
            style: customStyles.tableHeader,
          ),
          Text(
            'Hash'.tr(),
            style: customStyles.tableHeader,
          ),
          Text(
            'Rank'.tr(),
            style: customStyles.tableHeader,
          ),
        ],
      ),
    );
  }
}
