import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:threedpass/features/hashes_list/bloc/hashes_list_bloc.dart';

class ObjectsListHeader extends StatelessWidget {
  const ObjectsListHeader({
    Key? key,
    required this.state,
  }) : super(key: key);

  final HashesListState state;

  @override
  Widget build(BuildContext context) {
    if (state is HashesListLoaded &&
        (state as HashesListLoaded).objects.isNotEmpty) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Text(
          'saved_objects_header'.tr(),
          style: Theme.of(context).textTheme.headline5,
        ),
      );
    } else {
      return const SizedBox();
    }
  }
}
