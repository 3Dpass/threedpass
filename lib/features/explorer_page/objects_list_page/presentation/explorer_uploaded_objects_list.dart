import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/widgets/progress_indicator/thin_progress_indicator.dart';
import 'package:threedpass/core/widgets/text/d3p_body_medium_text.dart';
import 'package:threedpass/features/poscan_objects_query/bloc/poscan_objects_cubit.dart';
import 'package:threedpass/features/poscan_objects_query/domain/entities/uploaded_object.dart';
import 'package:threedpass/features/wallet_screen/assets_page/widgets/objects_list/objects_list_pure.dart';

class ExplorerUploadedObjectsList extends StatelessWidget {
  const ExplorerUploadedObjectsList({
    super.key,
  });

  @override
  Widget build(final BuildContext context) {
    return BlocBuilder<PoscanObjectsCubit, PoscanObjectsState>(
      builder: (final context, final state) {
        final relatedObjects = <UploadedObject>[];

        state.objects.forEach((final obj) {
          // if (true) {
          relatedObjects.add(obj);
          // }
        });

        if (relatedObjects.isEmpty) {
          // return const SizedBox();
          return const Padding(
            padding: EdgeInsets.only(
              left: 16,
              right: 16,
            ),
            child: D3pBodyMediumText('no_objects'),
          );
        }

        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: ObjectsListPure(
                objects: relatedObjects,
              ),
            ),
            if (state.status == PoscanObjectStateStatus.loading)
              const ThinProgressIndicator(),
          ],
        );
      },
    );
  }
}
