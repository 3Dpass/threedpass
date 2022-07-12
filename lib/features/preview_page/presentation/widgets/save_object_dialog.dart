import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/features/hashes_list/domain/entities/hash_object.dart';
import 'package:threedpass/features/hashes_list/domain/entities/snapshot.dart';
import 'package:threedpass/features/hashes_list/presentation/bloc/hashes_list_bloc.dart';
import 'package:threedpass/features/preview_page/presentation/bloc/outer_context_cubit.dart';
import 'package:threedpass/router/route_names.dart';
import 'package:threedpass/router/router.dart';

class SaveObjectDialog extends StatelessWidget {
  SaveObjectDialog({
    Key? key,
    required this.snapshot,
  })  : snapshotNameController = TextEditingController(text: snapshot.name),
        super(key: key);

  final TextEditingController snapshotNameController;
  final objectNameController = TextEditingController();
  final Snapshot snapshot;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: Column(
            children: <Widget>[
              Text(
                'create_object_title'.tr(),
                style: Theme.of(context).textTheme.subtitle1,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 8,
                  right: 8,
                  bottom: 8,
                  top: 16,
                ),
                child: TextField(
                  decoration: InputDecoration(
                    label: Text('create_object_input_label'.tr()),
                    hintText: 'create_object_input_hint'.tr(),
                    isCollapsed: false,
                  ),
                  controller: objectNameController,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 8, bottom: 16),
                child: TextField(
                  decoration: InputDecoration(
                    label: Text('create_object_snap_input_label'.tr()),
                    hintText: 'create_object_snap_input_hint'.tr(),
                    isCollapsed: false,
                  ),
                  controller: snapshotNameController,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    child: Text('Cancel'.tr()),
                    onPressed: () => context.router.pop(),
                  ),
                  TextButton(
                    child: Text('Save'.tr()),
                    onPressed: () async {
                      final newNamedModel =
                          snapshot.copyWith(name: snapshotNameController.text);

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

                      final outerContext =
                          BlocProvider.of<OuterContextCubit>(context).state;

                      outerContext.router
                          .popUntilRouteWithName(RouteNames.scanPage);

                      outerContext.router.push(
                        PreviewWrapperRoute(
                          hashObject: newObject,
                          snapshot: newNamedModel,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
