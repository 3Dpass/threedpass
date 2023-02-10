import 'package:flutter/material.dart';
import 'package:threedpass/core/utils/cut_string.dart';
import 'package:threedpass/features/hashes_list/domain/entities/snapshot.dart';

class ChooseList extends StatelessWidget {
  const ChooseList({
    required this.list,
    required this.onChoose,
    required this.chosen,
    final Key? key,
  }) : super(key: key);

  final List<Snapshot> list;
  final Snapshot chosen;
  final void Function(Snapshot?) onChoose;

  @override
  Widget build(final BuildContext context) {
    return DropdownButton<Snapshot>(
      style: Theme.of(context).textTheme.bodyLarge,
      value: chosen,
      items: list
          .map(
            (final e) => DropdownMenuItem<Snapshot>(
              value: e,
              child: Text(
                e.name.cutWithEllipsis(12),
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
          )
          .toList(),
      onChanged: (final modelChosen) => onChoose(modelChosen),
    );
  }
}
