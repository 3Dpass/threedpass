import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/features/hashes_list/domain/entities/hash_object.dart';
import 'package:threedpass/features/hashes_list/domain/entities/snapshot.dart';
import 'package:threedpass/features/hashes_list/presentation/bloc/hashes_list_bloc.dart';
import 'package:threedpass/features/result_page/presentation/bloc/outer_context_cubit.dart';
import 'package:threedpass/features/result_page/presentation/widgets/dialogs/common_dialog.dart';
import 'package:threedpass/router/route_names.dart';
import 'package:threedpass/router/router.dart';

class RenameSnapshotDialog extends StatelessWidget {
  RenameSnapshotDialog({
    Key? key,
    required this.hashesModelToSave,
    required this.hashObject,
  }) : super(key: key);

  final controller = TextEditingController();
  final HashObject hashObject;
  final Snapshot hashesModelToSave;

  @override
  Widget build(BuildContext context) {
    return CommonDialog(
      hashesModelToSave: hashesModelToSave,
      hashObject: hashObject,
      title: 'Rename snapshot',
      actionText: 'Rename',
      action: (value) async {
        final newNamedModel = hashesModelToSave.copyWith(name: value);

        BlocProvider.of<HashesListBloc>(context).add(
          ReplaceSnapshot(
            hash: newNamedModel,
            object: hashObject,
          ),
        );

        final outerContext = BlocProvider.of<OuterContextCubit>(context).state;

        outerContext.router.popUntilRouteWithName(RouteNames.homePage);

        outerContext.router.push(
          PreviewWrapperRoute(
            hashObject: hashObject,
            snapshot: newNamedModel,
          ),
        );
      },
    );
  }
}
