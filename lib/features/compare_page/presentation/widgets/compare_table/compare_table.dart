import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/theme/d3p_special_colors.dart';
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
            const H16(),
            const TableHeader(),
            const H16(),
            Flexible(
              child: ListView.separated(
                padding: const EdgeInsets.only(bottom: 24),
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
    final setOfAdded = <String>{};

    final allMainHashes = mainObject.hashes;

    int j = 0; // second object counter

    for (int i = 0; i < allMainHashes.length; i++) {
      final hash = allMainHashes[i];
      if (hash.isEmpty) continue;

      setOfAdded.add(hash);

      final sndObjHasHash = objectToCompare.hashes.contains(hash);

      if (sndObjHasHash) {
        j++;
      }

      rowsData.add(
        RowData(
          rank1: (i + 1).toString(),
          hash: hash,
          rank2: sndObjHasHash ? '$j' : '',
          isStableHash: stableHashes.contains(hash),
        ),
      );
    }

    final sndHashes = objectToCompare.hashes;

    for (int i = 0; i < sndHashes.length; i++) {
      final hash = sndHashes[i];
      if (hash.isEmpty) continue;

      if (setOfAdded.contains(hash)) continue;

      j++;

      rowsData.add(
        RowData(
          rank1: '',
          hash: hash,
          rank2: '$j',
          isStableHash: stableHashes.contains(hash),
        ),
      );
    }

    return rowsData;
  }
}
