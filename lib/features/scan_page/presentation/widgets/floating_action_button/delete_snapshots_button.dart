import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/features/hashes_list/bloc/hashes_list_bloc.dart';
import 'package:threedpass/features/scan_page/bloc/select_snapshots_cubit.dart';
import 'package:threedpass/router/router.gr.dart';

class DeleteSnaphotsButton extends StatelessWidget {
  const DeleteSnaphotsButton({super.key});

  @override
  Widget build(final BuildContext context) {
    final selectBloc = BlocProvider.of<SelectSnapshotsCubit>(context);
    return BlocBuilder<HashesListBloc, HashesListState>(
      builder: (final BuildContext context, final HashesListState state) {
        return FloatingActionButton(
          child: const Icon(Icons.delete),
          backgroundColor: state.isLoading
              ? Theme.of(context).disabledColor
              : Theme.of(context).colorScheme.error,
          heroTag: 'delete_snapshots',
          onPressed: state.isLoading
              ? null
              : () => context.router.push(
                    DeleteSnapshotsRoute(
                      selectSnapshotsCubit: selectBloc,
                    ),
                  ),
        );
      },
    );
  }
}
