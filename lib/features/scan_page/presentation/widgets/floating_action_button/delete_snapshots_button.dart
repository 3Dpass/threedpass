import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/features/scan_page/bloc/select_snapshots_cubit.dart';
import 'package:threedpass/features/scan_page/presentation/widgets/floating_action_button/delete_snapshots_dialog.dart';

class DeleteSnaphotsButton extends StatelessWidget {
  const DeleteSnaphotsButton({super.key});

  @override
  Widget build(final BuildContext context) {
    final selectBloc = BlocProvider.of<SelectSnapshotsCubit>(context);
    return FloatingActionButton(
      heroTag: 'delete_snapshots',
      backgroundColor: Colors.red,
      child: const Icon(Icons.delete),
      onPressed: () => showDialog<dynamic>(
        context: context,
        builder: (final context) => DeleteSnapshotsDialog(
          selectSnapshotsCubit: selectBloc,
        ),
      ),
    );
  }
}
