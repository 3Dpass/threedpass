import 'package:flutter/material.dart';
import 'package:threedpass/core/utils/cut_string.dart';
import 'package:threedpass/features/compare_page/presentation/widgets/choose_list.dart';
import 'package:threedpass/features/hashes_list/domain/entities/snapshot.dart';

class CompareRow extends StatelessWidget {
  const CompareRow({
    required this.onChoose,
    required this.origSnap,
    required this.allSnapshots,
    required this.snapToCompare,
    final Key? key,
  }) : super(key: key);

  final List<Snapshot> allSnapshots;
  final void Function(Snapshot? model) onChoose;
  final Snapshot origSnap;
  final Snapshot snapToCompare;

  @override
  Widget build(final BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Flexible(
          flex: 2,
          child: SizedBox(
            width: double.infinity,
            child: Text(
              origSnap.name.cutWithEllipsis(16),
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
        ),
        Flexible(
          child: SizedBox(
            width: double.infinity,
            child: Text(
              'VS',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
        ),
        Flexible(
          flex: 2,
          child: SizedBox(
            width: double.infinity,
            child: ChooseList(
              chosen: snapToCompare,
              list: allSnapshots,
              onChoose: (final model) => onChoose(model),
            ),
          ),
        ),
      ],
    );
  }
}
