import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/features/hashes_list/presentation/bloc/hashes_list_bloc.dart';

class ObjectsListHeader extends StatelessWidget {
  const ObjectsListHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HashesListBloc, HashesListState>(
      builder: (context, state) {
        if (state is HashesListLoaded && state.objects.isNotEmpty) {
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
      },
    );
  }
}
