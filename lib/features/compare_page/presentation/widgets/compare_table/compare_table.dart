import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/theme/d3p_special_colors.dart';
import 'package:threedpass/core/theme/d3p_special_styles.dart';
import 'package:threedpass/core/widgets/paddings.dart';
import 'package:threedpass/features/compare_page/bloc/compare_cubit.dart';
import 'package:threedpass/features/compare_page/domain/entities/row_data.dart';
import 'package:threedpass/features/compare_page/presentation/widgets/compare_table/app_table_row.dart';
import 'package:threedpass/features/compare_page/presentation/widgets/compare_table/table_header.dart';
import 'package:threedpass/features/hashes_list/domain/entities/snapshot.dart';

class CompareTable extends StatelessWidget {
  const CompareTable({
    final Key? key,
  }) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    final theme = Theme.of(context);
    final cubit = context.read<CompareCubit>();
    final mainObject = cubit.origObj;
    final stableHashes = cubit.stableHashes;

    return BlocBuilder<CompareCubit, Snapshot>(
      builder: (final context, final state) {
        final rowsData = RowsData(
          context: context,
          objectToCompare: state,
          mainObject: mainObject,
          stableHashes: stableHashes,
        ).build();

        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBoxH16(),
            TableHeader(),
            const SizedBoxH16(),
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
      },
    );
  }
}

class RowsData {
  const RowsData({
    required this.context,
    required this.objectToCompare,
    required this.mainObject,
    required this.stableHashes,
  });
  final BuildContext context;
  final Snapshot objectToCompare;
  final Snapshot mainObject;
  final List<String> stableHashes;

  List<RowData> build() {
    final rowsData = <RowData>[];
    for (final mainHash in mainObject.hashes) {
      if (objectToCompare.hashes.contains(mainHash)) {
        rowsData.add(
          RowData(
            rank1: (mainObject.hashes.indexOf(mainHash) + 1).toString(),
            hash: mainHash,
            rank2: (objectToCompare.hashes.indexOf(mainHash) + 1).toString(),
            isStableHash: stableHashes.contains(mainHash),
          ),
        );
      }
    }

    return rowsData;
  }
}
