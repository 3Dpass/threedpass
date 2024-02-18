import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/widgets/other/padding_16.dart';
import 'package:threedpass/core/widgets/progress_indicator/thin_progress_indicator.dart';
import 'package:threedpass/core/widgets/text/d3p_body_medium_text.dart';
import 'package:threedpass/features/poscan_objects_query/bloc/poscan_objects_cubit.dart';
import 'package:threedpass/features/poscan_objects_query/domain/entities/uploaded_object.dart';
import 'package:threedpass/features/wallet_screen/assets_page/widgets/objects_list/objects_list_empty_refresh_widget.dart';
import 'package:threedpass/features/wallet_screen/assets_page/widgets/objects_list/objects_list_header_full.dart';
import 'package:threedpass/features/wallet_screen/assets_page/widgets/objects_list/objects_list_pure.dart';
import 'package:threedpass/features/wallet_screen/notifications_page/bloc/notifications_bloc.dart';

class UploadedObjectsList extends StatelessWidget {
  const UploadedObjectsList({
    required this.filter,
    required this.showHeader,
    super.key,
  });

  final bool showHeader;
  final bool Function(UploadedObject object) filter;

  @override
  Widget build(final BuildContext context) {
    return BlocBuilder<PoscanObjectsCubit, PoscanObjectsState>(
      builder: (final context, final state) =>
          BlocBuilder<NotificationsBloc, NotificationsState>(
        buildWhen: (final previous, final current) =>
            hasPutObj(previous) != hasPutObj(current),
        builder: (final context, final notifState) {
          final relatedObjects = <UploadedObject>[];

          state.objects.forEach((final obj) {
            if (filter(obj)) {
              relatedObjects.add(obj);
            }
          });

          if (relatedObjects.isEmpty && hasPutObj(notifState)) {
            return ObjectsListEmptyRefresh(
              showHeader: showHeader,
            );
          }

          if (relatedObjects.isEmpty) {
            return const Padding(
              padding: EdgeInsets.only(
                top: 16,
                left: 16,
                right: 16,
              ),
              child: D3pBodyMediumText('no_objects'),
            );
          }

          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // const SizedBoxH16(),
              if (showHeader)
                const Padding16(
                  child: ObjectsListHeaderFull(),
                ),
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
      ),
    );
  }

  static bool hasPutObj(final NotificationsState state) {
    final types = state.notifications.map((final e) => e.type).toList();
    return types.contains(NotificationType.putObject);
  }
}
