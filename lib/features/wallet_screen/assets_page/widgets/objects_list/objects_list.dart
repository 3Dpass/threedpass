import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/polkawallet/app_service.dart';
import 'package:threedpass/core/widgets/other/padding_16.dart';
import 'package:threedpass/core/widgets/progress_indicator/thin_progress_indicator.dart';
import 'package:threedpass/features/poscan_objects_query/bloc/poscan_objects_cubit.dart';
import 'package:threedpass/features/poscan_objects_query/domain/entities/uploaded_object.dart';
import 'package:threedpass/features/wallet_screen/assets_page/widgets/objects_list/objects_list_empty_refresh_widget.dart';
import 'package:threedpass/features/wallet_screen/assets_page/widgets/objects_list/objects_list_header_full.dart';
import 'package:threedpass/features/wallet_screen/assets_page/widgets/objects_list/objects_list_pure.dart';
import 'package:threedpass/features/wallet_screen/notifications_page/bloc/notifications_bloc.dart';

class AssetsUploadedObjectsList extends StatelessWidget {
  const AssetsUploadedObjectsList({
    required this.appService,
    super.key,
  });

  final AppService appService;

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
            if (obj.owner == appService.keyring.current.address) {
              relatedObjects.add(obj);
            }
          });

          if (relatedObjects.isEmpty && hasPutObj(notifState)) {
            return const ObjectsListEmptyRefresh();
          }

          if (relatedObjects.isEmpty) {
            return const SizedBox();
          }

          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
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
