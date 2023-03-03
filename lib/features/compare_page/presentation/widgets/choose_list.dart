part of '../pages/compare_page.dart';

class ChooseList extends StatelessWidget {
  const ChooseList({
    final Key? key,
  }) : super(key: key);

  // final List<Snapshot> list;
  // final Snapshot chosen;
  // final void Function(Snapshot?) onChoose;

  @override
  Widget build(final BuildContext context) {
    return BlocBuilder<CompareCubit, Snapshot>(
      builder: (final context, final state) {
        final cubit = BlocProvider.of<CompareCubit>(context);
        return D3pDropdownButton<Snapshot>(
          context: context,
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
