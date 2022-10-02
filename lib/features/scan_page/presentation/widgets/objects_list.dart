import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:threedpass/features/hashes_list/bloc/hashes_list_bloc.dart';
import 'package:threedpass/features/scan_page/presentation/widgets/snapshots_list.dart';

class ObjectsList extends StatelessWidget {
  const ObjectsList({
    Key? key,
    required this.state,
  }) : super(key: key);

  final HashesListState state;

  @override
  Widget build(BuildContext context) {
    if (state is HashesListLoaded) {
      return ListView.builder(
        padding: const EdgeInsets.only(bottom: 46 * 2),
        shrinkWrap: true,
        itemCount: (state as HashesListLoaded).objects.length,
        itemBuilder: (context, objIndex) {
          final currentObject = (state as HashesListLoaded).objects[objIndex];

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                child: Text(
                  'object_title_prefix'.tr() + ' ' + currentObject.name,
                  style: Theme.of(context).textTheme.headline6,
                ),
                padding: const EdgeInsets.only(
                  top: 16,
                  left: 16,
                  right: 16,
                ),
              ),
              SnapshotsList(
                currentObject: currentObject,
              ),
            ],
          );
        },
      );
    }
    return const SizedBox();
  }
}
