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
class RenameObjectDialog extends StatelessWidget {
  const RenameObjectDialog({
    required this.snapshot,
    required this.hashObject,
    final Key? key,
  }) : super(key: key);

  final HashObject hashObject;
  final Snapshot snapshot;

  Future<void> renameObject(
    final String newName,
    final BuildContext context,
  ) async {
    final newObj = hashObject.copyWith(name: newName);

    BlocProvider.of<HashesListBloc>(context).add(
      ReplaceObject(
        oldObj: hashObject,
        newObj: newObj,
      ),
    );

    final outerContext = BlocProvider.of<OuterContextCubit>(context).state;
    // TODO When rename object do bloc_builder instead of re-push
    await outerContext.router.pop();

    unawaited(
      outerContext.router.push(
        PreviewRouteWrapper(
          hashObject: newObj,
          snapshot: snapshot,
        ),
      ),
    );
  }

  @override
  Widget build(final BuildContext context) {
    return CommonDialog(
      snapshot: snapshot,
      hashObject: hashObject,
      initialText: hashObject.name,
      title: 'rename_object_dialog_title'.tr(),
      actionText: 'rename_object_dialog_action'.tr(),
      action: (final value) async => renameObject(value, context),
    );
  }
}
