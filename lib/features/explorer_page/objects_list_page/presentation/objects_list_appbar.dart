import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/features/poscan_objects_query/bloc/poscan_objects_cubit.dart';

class ObjectsListAppbar extends StatelessWidget {
  const ObjectsListAppbar({super.key});

  @override
  Widget build(final BuildContext context) {
    return BlocBuilder<PoscanObjectsCubit, PoscanObjectsState>(
      buildWhen: (final previous, final current) =>
          previous.storageCount != current.storageCount,
      builder: (final context, final state) {
        final objectsCount = state.storageCount ?? 0;
        return Text(
          objectsCount == 0
              ? 'No info about storage...'
              : 'objects_list_appbar_title'.tr(
                  args: [
                    'objects_plural'.plural(objectsCount),
                  ],
                ),
        );
      },
    );
  }
}
