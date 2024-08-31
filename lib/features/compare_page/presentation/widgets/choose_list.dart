import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/widgets/buttons/dropdown_button.dart';
import 'package:threedpass/features/compare_page/bloc/compare_cubit.dart';
import 'package:threedpass/features/hashes_list/domain/entities/snapshot.dart';

class ChooseList extends StatelessWidget {
  const ChooseList({
    final Key? key,
  }) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    return BlocBuilder<CompareCubit, Snapshot>(
      builder: (final context, final state) {
        final cubit = BlocProvider.of<CompareCubit>(context);
        return D3pDropdownButton<Snapshot>(
          selectedItemBuilder: (final context) =>
              cubit.snapshotsToCompare.map<Widget>((final Snapshot item) {
            return Center(
              child: Text(
                item.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            );
          }).toList(),
          isExpanded: true,
          value: state,
          items: cubit.snapshotsToCompare
              .map(
                (final e) => DropdownMenuItem<Snapshot>(
                  value: e,
                  child: Text(e.name),
                ),
              )
              .toList(),
          onChanged: (final modelChosen) => cubit.onChoose(modelChosen),
        );
      },
    );
  }
}
