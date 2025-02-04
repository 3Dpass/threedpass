// import 'package:auto_route/auto_route.dart';
import 'package:auto_route/annotations.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/widgets/buttons/text_button.dart';
import 'package:threedpass/core/widgets/dialog/d3p_platform_dialog.dart';
import 'package:threedpass/features/hashes_list/bloc/hashes_list_bloc.dart';
import 'package:threedpass/features/scan_page/bloc/select_snapshots_cubit.dart';

@RoutePage()
class DeleteSnapshotsDialog extends StatelessWidget {
  const DeleteSnapshotsDialog({required this.selectSnapshotsCubit, super.key});

  final SelectSnapshotsCubit selectSnapshotsCubit;

  void deleteSnap(final BuildContext context) {
    final hashesBloc = BlocProvider.of<HashesListBloc>(context);

    hashesBloc.add(
      DeleteSnapshots(
        snapshots: selectSnapshotsCubit.state.snaps,
      ),
    );

    selectSnapshotsCubit.makeUnselectable();
    Navigator.of(context).pop();
  }

  @override
  Widget build(final BuildContext context) {
    return D3pPlatformDialog(
      title: 'delete_snapshots_dialog_title'.tr(),
      content: Text('delete_snapshots_dialog_content'.tr(args: [
        'snapshots_plural'.plural(selectSnapshotsCubit.state.snaps.length),
      ])),
      actions: [
        D3pTextButton(
          text: 'Cancel'.tr(),
          onPressed: () => Navigator.of(context).pop(),
        ),
        D3pTextButton(
          text: 'Delete'.tr(),
          onPressed: () => deleteSnap(context),
        ),
      ],
    );
  }
}
