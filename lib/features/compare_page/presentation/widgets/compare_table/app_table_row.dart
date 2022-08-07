import 'package:flutter/material.dart';
import 'package:threedpass/common/app_text_styles.dart';
import 'package:threedpass/features/compare_page/domain/entities/row_data.dart';

class AppTableRow extends StatelessWidget {
  const AppTableRow({
    Key? key,
    required this.rowData,
  }) : super(key: key);

  final RowData rowData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Text(rowData.rank1),
          const SizedBox(
            width: 48,
          ),
          Flexible(
            child: Text(
              rowData.hash,
              style: AppTextStyles.bodyText2.copyWith(
                fontWeight: rowData.isStableHash ? FontWeight.bold : null,
              ),
            ),
          ),
          const SizedBox(
            width: 48,
          ),
          Text(rowData.rank2),
        ],
      ),
    );
  }
}
