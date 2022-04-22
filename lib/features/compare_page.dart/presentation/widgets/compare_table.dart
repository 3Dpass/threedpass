import 'package:flutter/material.dart';
import 'package:threedpass/features/hashes_list/domain/entities/hashes_model.dart';

class CompareTable extends StatelessWidget {
  const CompareTable({
    Key? key,
    required this.comparable,
    required this.mainObject,
  }) : super(key: key);

  final HashesModel comparable;
  final HashesModel mainObject;

  List<DataRow> buildRows() {
    final res = <DataRow>[];
    for (var mainHash in mainObject.hashes) {
      if (comparable.hashes.contains(mainHash)) {
        res.add(
          DataRow(
            cells: <DataCell>[
              DataCell(
                Text((mainObject.hashes.indexOf(mainHash) + 1).toString()),
              ),
              DataCell(
                Text(
                  mainHash,
                ),
              ),
              DataCell(
                Text((comparable.hashes.indexOf(mainHash) + 1).toString()),
              ),
            ],
          ),
        );
      }
    }
    return res;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        columns: const <DataColumn>[
          DataColumn(
            label: Text(
              'Rank',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
          DataColumn(
            label: Text(
              'Hash',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
          DataColumn(
            label: Text(
              'Rank',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
        ],
        rows: buildRows(),
      ),
    );
  }
}
