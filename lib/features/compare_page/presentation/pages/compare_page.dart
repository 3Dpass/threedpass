import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:threedpass/features/compare_page/presentation/widgets/compare_row.dart';
import 'package:threedpass/features/compare_page/presentation/widgets/compare_table/compare_table.dart';
import 'package:threedpass/features/hashes_list/domain/entities/snapshot.dart';

// TODO Rewrite stateful to cubit
class ComparePage extends StatefulWidget {
  const ComparePage({
    required this.origObj,
    required this.comparisons,
    required this.stableHashes,
    final Key? key,
  }) : super(key: key);

  final List<Snapshot> comparisons;
  final Snapshot origObj;
  final List<String> stableHashes;

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<ComparePage> {
  late Snapshot comparable;

  @override
  void initState() {
    comparable = widget.comparisons.first;
    super.initState();
  }

  void onChoose(final Snapshot? model) {
    if (model != null) {
      setState(() {
        comparable = model;
      });
    }
  }

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('compare_page_appbar'.tr()),
      ),
      body: Column(
        children: <Widget>[
          Flexible(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: CompareRow(
                origSnap: widget.origObj,
                snapToCompare: comparable,
                allSnapshots: widget.comparisons,
                onChoose: onChoose,
              ),
            ),
          ),
          const Divider(
            height: 15,
            thickness: 3,
            color: Colors.black,
          ),
          CompareTable(
            comparable: comparable,
            mainObject: widget.origObj,
            stableHashes: widget.stableHashes,
          ),
        ],
      ),
    );
  }
}
