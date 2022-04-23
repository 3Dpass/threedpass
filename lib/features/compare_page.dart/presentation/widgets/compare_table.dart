import 'package:flutter/material.dart';
import 'package:threedpass/common/app_text_styles.dart';
import 'package:threedpass/features/hashes_list/domain/entities/hashes_model.dart';

class CompareTable extends StatelessWidget {
  const CompareTable({
    Key? key,
    required this.comparable,
    required this.mainObject,
  }) : super(key: key);

  final HashesModel comparable;
  final HashesModel mainObject;

  List<_RowData> get rowsData {
    final res = <_RowData>[];
    for (var mainHash in mainObject.hashes) {
      if (comparable.hashes.contains(mainHash)) {
        res.add(
          _RowData(
            rank1: (mainObject.hashes.indexOf(mainHash) + 1).toString(),
            hash: mainHash,
            rank2: (comparable.hashes.indexOf(mainHash) + 1).toString(),
          ),
        );
      }
    }
    return res;
  }

  @override
  Widget build(BuildContext context) {
    final rows = rowsData;
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
            children: const [
              Text(
                'Rank',
                style: AppTextStyles.tableHeader,
              ),
              Text(
                'Hash',
                style: AppTextStyles.tableHeader,
              ),
              Text(
                'Rank',
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
          itemBuilder: (context, index) => _TableRow(rowData: rows[index]),
          separatorBuilder: (_, __) => const Divider(color: Colors.grey),
          itemCount: rows.length,
        ),
      ],
    );
  }
}

class _RowData {
  final String rank1;
  final String rank2;
  final String hash;

  const _RowData({
    required this.rank1,
    required this.hash,
    required this.rank2,
  });
}

class _TableRow extends StatelessWidget {
  final _RowData rowData;

  const _TableRow({required this.rowData});

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
            child: Text(rowData.hash),
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
