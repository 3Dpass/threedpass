import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/features/explorer_page/objects_list_page/presentation/reload_objects_icon_button.dart';
import 'package:threedpass/features/poscan_objects_query/bloc/poscan_objects_cubit.dart';

class ObjectsListAppbar extends StatelessWidget {
  const ObjectsListAppbar({super.key});

  @override
  Widget build(final BuildContext context) {
    return BlocBuilder<PoscanObjectsCubit, PoscanObjectsState>(
      builder: (final context, final state) {
        final objectsCount = state.storageCount ?? state.objects.length;
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Text(
                objectsCount == 0
                    ? 'No info about storage...'
                    : 'objects_list_appbar_title'.tr(
                        args: [
                          'objects_plural'.plural(objectsCount),
                        ],
                      ),
                textAlign: TextAlign.start,
                style: const TextStyle(color: Colors.white),
              ),
            ),
            const ReloadObjectsIconButton(),
          ],
        );
      },
    );
  }
}
