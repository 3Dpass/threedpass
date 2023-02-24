import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/theme/d3p_special_colors.dart';
import 'package:threedpass/core/theme/d3p_special_styles.dart';
import 'package:threedpass/features/compare_page/bloc/compare_cubit.dart';
import 'package:threedpass/features/compare_page/domain/entities/row_data.dart';
import 'package:threedpass/features/compare_page/presentation/widgets/compare_table/app_table_row.dart';
import 'package:threedpass/features/hashes_list/domain/entities/snapshot.dart';

class CompareTable extends StatelessWidget {
  const CompareTable({
    final Key? key,
  }) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    final theme = Theme.of(context);
    final customStyles = theme.customTextStyles;
    final cubit = context.read<CompareCubit>();
    final mainObject = cubit.origObj;
    final stableHashes = cubit.stableHashes;

    return BlocBuilder<CompareCubit, Snapshot>(builder: (context, state) {
      final comparable = state;

      final rowsData = <RowData>[];
      for (final mainHash in mainObject.hashes) {
        if (comparable.hashes.contains(mainHash)) {
          rowsData.add(
            RowData(
              rank1: (mainObject.hashes.indexOf(mainHash) + 1).toString(),
              hash: mainHash,
              rank2: (comparable.hashes.indexOf(mainHash) + 1).toString(),
              isStableHash: stableHashes.contains(mainHash),
            ),
          );
        }
      }

      print(rowsData.length);

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
          ),
          const SizedBox(
            height: 16,
          ),
          Flexible(
            child: ListView.separated(
              shrinkWrap: true,
              itemBuilder: (final context, final index) =>
                  AppTableRow(rowData: rowsData[index]),
              separatorBuilder: (final _, final __) => Divider(
                color: theme.customColors.dividerColor,
              ),
              itemCount: rowsData.length,
            ),
          ),
        ],
      );
    });
  }
}
