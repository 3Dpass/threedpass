import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/widgets/buttons/icon_button.dart';
import 'package:threedpass/features/scan_page/bloc/select_snapshots_cubit.dart';

class SelectManyIconButton extends StatelessWidget {
  const SelectManyIconButton({super.key});

  @override
  Widget build(final BuildContext context) {
    return BlocBuilder<SelectSnapshotsCubit, SelectSnapshotsState>(
      builder: (final context, final state) {
        return state.areSelectable
            ? D3pIconButton(
                iconData: Icons.close,
                padding: const EdgeInsets.symmetric(horizontal: 14),
                onPressed: () => BlocProvider.of<SelectSnapshotsCubit>(context)
                    .makeUnselectable(),
              )
            : D3pIconButton(
                iconData: Icons.delete_sweep_outlined,
                padding: const EdgeInsets.symmetric(horizontal: 14),
                onPressed: () => BlocProvider.of<SelectSnapshotsCubit>(context)
                    .makeSelectable(),
              );
      },
    );
  }
}
