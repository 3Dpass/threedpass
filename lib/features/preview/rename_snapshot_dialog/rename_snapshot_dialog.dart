import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/features/hashes_list/bloc/hashes_list_bloc.dart';
import 'package:threedpass/features/hashes_list/domain/entities/hash_object.dart';
import 'package:threedpass/features/hashes_list/domain/entities/snapshot.dart';
import 'package:threedpass/features/preview/preview_page/bloc/outer_context_cubit.dart';
import 'package:threedpass/features/preview/preview_page/presentation/widgets/dialogs/common_dialog.dart';
import 'package:threedpass/router/router.gr.dart';

@RoutePage()
class RenameSnapshotDialog extends StatelessWidget {
  const RenameSnapshotDialog({
    required this.snapshot,
    required this.hashObject,
    final Key? key,
  }) : super(key: key);

  final HashObject hashObject;
  final Snapshot snapshot;

  Future<void> renameSnapshot(
    final String newName,
    final BuildContext context,
  ) async {
    final newNamedModel = snapshot.copyWith(name: newName);

    BlocProvider.of<HashesListBloc>(context).add(
      ReplaceSnapshot(
        oldSnapshot: snapshot,
        newSnapshot: newNamedModel,
        object: hashObject,
      ),
    );

    final outerContext = BlocProvider.of<OuterContextCubit>(context).state;
    // TODO When rename object do bloc_builder instead of re-push
    await outerContext.router.pop();

    unawaited(
      outerContext.router.push(
        PreviewRouteWrapper(
          snapshot: newNamedModel,
        ),
      ),
    );
  }

  @override
  Widget build(final BuildContext context) {
    return CommonDialog(
      snapshot: snapshot,
      hashObject: hashObject,
      initialText: snapshot.name,
      title: 'rename_snapshot_title'.tr(),
      actionText: 'rename_action'.tr(),
      action: (final value) => renameSnapshot(value, context),
    );
  }
}
