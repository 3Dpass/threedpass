import 'package:flutter/material.dart';
import 'package:threedpass/core/theme/d3p_special_styles.dart';
import 'package:threedpass/core/widgets/text/d3p_body_medium_text.dart';
import 'package:threedpass/features/compare_page/domain/entities/row_data.dart';

class AppTableRow extends StatelessWidget {
  const AppTableRow({
    required this.rowData,
    final Key? key,
  }) : super(key: key);

  final RowData rowData;

  @override
  Widget build(final BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          SizedBox(
            width: 48,
            child: D3pBodyMediumText(
              rowData.rank1,
              translate: false,
            ),
          ),
          Flexible(
            child: Text(
              rowData.hash,
              style: Theme.of(context).customTextStyles.d3pBodyMedium.copyWith(
                    fontWeight: rowData.isStableHash ? FontWeight.bold : null,
                  ),
            ),
          ),
          SizedBox(
            width: 48,
            child: D3pBodyMediumText(
              rowData.rank2,
              translate: false,
              textAlign: TextAlign.end,
            ),
          ),
        ],
      ),
    );
  }
}
