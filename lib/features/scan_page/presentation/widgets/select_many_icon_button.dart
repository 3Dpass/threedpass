import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/widgets/buttons/icon_button.dart';
import 'package:threedpass/features/scan_page/bloc/select_snapshots_cubit.dart';

class SelectManyIconButton extends StatelessWidget {
  const SelectManyIconButton({super.key});

  @override
  Widget build(final BuildContext context) {
    return BlocBuilder<SelectSnapshotsCubit, SelectSnapshotsState>(
      builder: (final context, final state) {
        if (state.areSelectable) {
          return D3pIconButton(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            // emptyContraints: false,
            iconData: Icons.close,
            onPressed: () => BlocProvider.of<SelectSnapshotsCubit>(context)
                .makeUnselectable(),
          );
        } else {
          return D3pIconButton(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            // emptyContraints: true,
            iconData: Icons.check_box_outlined,
            onPressed: () =>
                BlocProvider.of<SelectSnapshotsCubit>(context).makeSelectable(),
          );
        }
      },
    );
  }
}
