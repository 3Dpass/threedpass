import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:threedpass/common/app_text_styles.dart';
import 'package:threedpass/features/compare_page.dart/domain/entities/row_data.dart';
import 'package:threedpass/features/compare_page.dart/presentation/widgets/compare_table/app_table_row.dart';
import 'package:threedpass/features/hashes_list/domain/entities/snapshot.dart';

class CompareTable extends StatelessWidget {
  const CompareTable({
    Key? key,
    required this.comparable,
    required this.mainObject,
    required this.stableHashes,
  }) : super(key: key);

  final Snapshot comparable;
  final Snapshot mainObject;
  final List<String> stableHashes;

  List<RowData> get rowsData {
    final res = <RowData>[];
    for (var mainHash in mainObject.hashes) {
      if (comparable.hashes.contains(mainHash)) {
        res.add(
          RowData(
            rank1: (mainObject.hashes.indexOf(mainHash) + 1).toString(),
            hash: mainHash,
            rank2: (comparable.hashes.indexOf(mainHash) + 1).toString(),
            isStableHash: stableHashes.contains(mainHash),
          ),
        );
      }
    }
    return res;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(
          height: 16,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Rank'.tr(),
                style: AppTextStyles.tableHeader,
              ),
              Text(
                'Hash'.tr(),
                style: AppTextStyles.tableHeader,
              ),
              Text(
                'Rank'.tr(),
                style: AppTextStyles.tableHeader,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        ListView.separated(
          shrinkWrap: true,
          itemBuilder: (context, index) =>
              AppTableRow(rowData: rowsData[index]),
          separatorBuilder: (_, __) => const Divider(color: Colors.grey),
          itemCount: rowsData.length,
        ),
      ],
    );
  }
}
