import 'package:flutter/material.dart';
import 'package:threedpass/core/utils/cut_string.dart';
import 'package:threedpass/features/compare_page/presentation/widgets/choose_list.dart';
import 'package:threedpass/features/hashes_list/domain/entities/snapshot.dart';

class CompareRow extends StatelessWidget {
  const CompareRow({
    Key? key,
    required this.onChoose,
    required this.origSnap,
    required this.allSnapshots,
    required this.snapToCompare,
  }) : super(key: key);

  final List<Snapshot> allSnapshots;
  final void Function(Snapshot? model) onChoose;
  final Snapshot origSnap;
  final Snapshot snapToCompare;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Flexible(
          flex: 2,
          child: Text(
            origSnap.name.cut(16),
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
            chosen: snapToCompare,
            list: allSnapshots,
            onChoose: (model) => onChoose(model),
          ),
        ),
      ],
    );
  }
}
