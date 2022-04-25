import 'package:flutter/material.dart';
import 'package:threedpass/features/compare_page.dart/presentation/widgets/choose_list.dart';
import 'package:threedpass/features/compare_page.dart/presentation/widgets/compare_table.dart';
import 'package:threedpass/features/hashes_list/domain/entities/hashes_model.dart';

class ComparePage extends StatefulWidget {
  const ComparePage({
    Key? key,
    required this.origObj,
    required this.comparisons,
  }) : super(key: key);

  final List<HashesModel> comparisons;
  final HashesModel origObj;

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<ComparePage> {
  late HashesModel comparable;

  @override
  void initState() {
    comparable = widget.comparisons.first;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Compare top hashes"),
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
                    widget.origObj.name,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const Flexible(
                  child: Text(
                    "VS",
                    textAlign: TextAlign.center,
                  ),
                ),
                Flexible(
                  flex: 2,
                  child: ChooseList(
                    chosen: comparable,
                    list: widget.comparisons,
                    onChoose: (model) {
                      if (model != null) {
                        setState(() {
                          comparable = model;
                        });
                      }
                    },
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
          ),
        ],
      ),
    );
  }
}
