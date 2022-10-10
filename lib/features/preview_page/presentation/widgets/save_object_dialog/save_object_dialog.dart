import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/features/hashes_list/bloc/hashes_list_bloc.dart';
import 'package:threedpass/features/hashes_list/domain/entities/hash_object.dart';
import 'package:threedpass/features/hashes_list/domain/entities/snapshot.dart';
import 'package:threedpass/features/preview_page/bloc/outer_context_cubit.dart';
import 'package:threedpass/router/route_names.dart';

part './widgets/object_name_input.dart';
part './widgets/snapshot_name_input.dart';

class SaveObjectDialog extends StatelessWidget {
  SaveObjectDialog({
    required this.snapshot,
    final Key? key,
  })  : snapshotNameController = TextEditingController(text: snapshot.name),
        super(key: key);

  final objectNameController = TextEditingController();
  final Snapshot snapshot;
  final TextEditingController snapshotNameController;

  Future<void> saveObject(final BuildContext context) async {
    final newNamedModel = snapshot.copyWith(name: snapshotNameController.text);

    final newObject = HashObject.create(
      name: objectNameController.text,
      snapshots: [
        newNamedModel,
      ],
    );

    BlocProvider.of<HashesListBloc>(context).add(
      AddObject(
        object: newObject,
      ),
    );

    final outerContext = BlocProvider.of<OuterContextCubit>(context).state;
    outerContext.router.popUntilRouteWithName(RouteNames.homePage);
  }

  @override
  Widget build(final BuildContext context) {
    return Dialog(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              'create_object_title'.tr(),
              style: Theme.of(context).textTheme.subtitle1,
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 8, right: 8, bottom: 8, top: 16),
              child: _ObjectNameInput(objectNameController),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8, right: 8, bottom: 16),
              child: _SnapshotNameInput(snapshotNameController),
            ),
            Flexible(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: TextButton(
                      child: Text('Cancel'.tr()),
                      onPressed: () => context.router.pop(),
                    ),
                  ),
                  const Spacer(),
                  Flexible(
                    child: TextButton(
                      child: Text('Save'.tr()),
                      onPressed: () => saveObject(context),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
