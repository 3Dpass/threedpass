import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/utils/auto_route_getter.dart';
import 'package:threedpass/core/widgets/buttons/text_button.dart';
import 'package:threedpass/core/widgets/dialog/d3p_platform_dialog.dart';
import 'package:threedpass/features/hashes_list/bloc/hashes_list_bloc.dart';
import 'package:threedpass/features/hashes_list/domain/entities/snapshot.dart';
import 'package:threedpass/features/preview/preview_page/bloc/preview_page_cubit.dart';

@RoutePage()
class DeleteSnapshotDialog extends StatelessWidget {
  const DeleteSnapshotDialog({super.key});

  Future<void> deleteSnapshot(
    final BuildContext context,
    final Snapshot snapshot,
  ) async {
    BlocProvider.of<HashesListBloc>(context).add(
      DeleteSnapshots(
        snapshots: [snapshot],
      ),
    );

    unawaited(context.rootRouter.maybePop());
  }

  @override
  Widget build(final BuildContext context) {
    final snapshot = BlocProvider.of<PreviewPageCubit>(context).state;

    return D3pPlatformDialog(
      title: 'delete_snapshot_confirm_title'.tr(args: [snapshot.name]),
      content: const SingleChildScrollView(
        child: Column(
          children: <Widget>[],
        ),
      ),
      actions: [
        D3pTextButton(
          text: 'Cancel'.tr(),
          onPressed: () async => context.router.maybePop(),
        ),
        D3pTextButton(
          text: 'Delete'.tr(),
          onPressed: () async => deleteSnapshot(context, snapshot),
        ),
      ],
    );
  }
}
