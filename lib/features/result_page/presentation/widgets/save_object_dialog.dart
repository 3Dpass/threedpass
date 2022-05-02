import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/features/hashes_list/domain/entities/hash_object.dart';
import 'package:threedpass/features/hashes_list/domain/entities/snapshot.dart';
import 'package:threedpass/features/hashes_list/presentation/bloc/hashes_list_bloc.dart';
import 'package:threedpass/router/router.dart';

class SaveObjectDialog extends StatelessWidget {
  SaveObjectDialog({
    Key? key,
    required this.snapshot,
  }) : super(key: key);

  final snapshotNameController = TextEditingController();
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
                'Save object',
                style: Theme.of(context).textTheme.subtitle1,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 8, right: 8, bottom: 8, top: 16),
                child: TextField(
                  decoration: const InputDecoration(
                    label: Text('object'),
                    hintText: 'Enter object name',
                    isCollapsed: false,
                  ),
                  controller: objectNameController,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 8, bottom: 16),
                child: TextField(
                  decoration: const InputDecoration(
                    label: Text('snapshot'),
                    hintText: 'Enter snapshot name',
                    isCollapsed: false,
                  ),
                  controller: snapshotNameController,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    child: Text('Cancel'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  TextButton(
                    child: Text('Save'),
                    onPressed: () async {
                      Navigator.of(context).pop();

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

                      context.router.replace(
                        PreviewPageWrapperRoute(
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
