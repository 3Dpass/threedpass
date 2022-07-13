import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:threedpass/core/utils/cut_string.dart';
import 'package:threedpass/features/compare_page.dart/presentation/widgets/choose_list.dart';
import 'package:threedpass/features/compare_page.dart/presentation/widgets/compare_table/compare_table.dart';
import 'package:threedpass/features/hashes_list/domain/entities/snapshot.dart';

// TODO Rewrite stateful to cubit
class ComparePage extends StatefulWidget {
  const ComparePage({
    Key? key,
    required this.origObj,
    required this.comparisons,
    required this.stableHashes,
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

  void onChoose(Snapshot? model) {
    if (model != null) {
      setState(() {
        comparable = model;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('compare_page_appbar'.tr()),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Flexible(
                  flex: 2,
                  child: Text(
                    widget.origObj.name.cut(16),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const Flexible(
                  child: Text(
                    'VS',
                    textAlign: TextAlign.center,
                  ),
                ),
                Flexible(
                  flex: 2,
                  child: ChooseList(
                    chosen: comparable,
                    list: widget.comparisons,
                    onChoose: (model) => onChoose(model),
                  ),
                ),
              ],
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
