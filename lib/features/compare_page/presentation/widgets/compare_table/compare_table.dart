import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:threedpass/core/theme/d3p_special_styles.dart';
import 'package:threedpass/features/compare_page/domain/entities/row_data.dart';
import 'package:threedpass/features/compare_page/presentation/widgets/compare_table/app_table_row.dart';
import 'package:threedpass/features/hashes_list/domain/entities/snapshot.dart';

class CompareTable extends StatelessWidget {
  const CompareTable({
    required this.comparable,
    required this.mainObject,
    required this.stableHashes,
    final Key? key,
  }) : super(key: key);

  final Snapshot comparable;
  final Snapshot mainObject;
  final List<String> stableHashes;

  List<RowData> get rowsData {
    final res = <RowData>[];
    for (final mainHash in mainObject.hashes) {
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
  Widget build(final BuildContext context) {
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
                style: Theme.of(context).customTextStyles.tableHeader,
              ),
              Text(
                'Hash'.tr(),
                style: Theme.of(context).customTextStyles.tableHeader,
              ),
              Text(
                'Rank'.tr(),
                style: Theme.of(context).customTextStyles.tableHeader,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        ListView.separated(
          shrinkWrap: true,
          itemBuilder: (final context, final index) =>
              AppTableRow(rowData: rowsData[index]),
          separatorBuilder: (final _, final __) =>
              const Divider(color: Colors.grey),
          itemCount: rowsData.length,
        ),
      ],
    );
  }
}
