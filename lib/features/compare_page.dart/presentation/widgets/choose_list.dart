import 'package:flutter/material.dart';
import 'package:threedpass/features/hashes_list/domain/entities/snapshot.dart';

class ChooseList extends StatelessWidget {
  const ChooseList({
    Key? key,
    required this.list,
    required this.onChoose,
    required this.chosen,
  }) : super(key: key);

  final List<Snapshot> list;
  final Snapshot chosen;
  final void Function(Snapshot?) onChoose;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<Snapshot>(
      value: chosen,
      items: list
          .map(
            (e) => DropdownMenuItem<Snapshot>(
              value: e,
              child: Text(
                e.name,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          )
          .toList(),
      onChanged: (modelChosen) => onChoose(modelChosen),
    );
  }
}
