import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/utils/auto_route_getter.dart';
import 'package:threedpass/features/hashes_list/bloc/hashes_list_bloc.dart';
import 'package:threedpass/features/hashes_list/domain/entities/hash_object.dart';
import 'package:threedpass/features/hashes_list/domain/entities/snapshot.dart';
import 'package:threedpass/features/preview/preview_page/presentation/widgets/dialogs/common_dialog.dart';

@RoutePage()
class SaveHashDialog extends StatelessWidget {
  const SaveHashDialog({
    required this.snapshot,
    required this.hashObject,
    final Key? key,
  }) : super(key: key);

  final HashObject hashObject;
  final Snapshot snapshot;

  void saveSnapshot(
    final String name,
    final BuildContext context,
  ) {
    final newNamedModel = snapshot.copyWith(name: name);

    BlocProvider.of<HashesListBloc>(context).add(
      SaveSnapshot(
        hash: newNamedModel,
        object: hashObject,
      ),
    );

    context.rootRouter.maybePop();
  }

  @override
  Widget build(final BuildContext context) {
    return CommonDialog(
      hashObject: hashObject,
      snapshot: snapshot,
      action: (final value) => saveSnapshot(value, context),
      actionText: 'Save'.tr(),
      title: 'save_snapshot_title'.tr(),
      initialText: snapshot.name,
    );
  }
}
