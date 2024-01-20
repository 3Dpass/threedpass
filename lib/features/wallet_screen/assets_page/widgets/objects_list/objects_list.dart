import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/polkawallet/app_service.dart';
import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';
import 'package:threedpass/core/widgets/other/padding_16.dart';
import 'package:threedpass/core/widgets/paddings.dart';
import 'package:threedpass/core/widgets/progress_indicator/thin_progress_indicator.dart';
import 'package:threedpass/core/widgets/text/d3p_body_medium_text.dart';
import 'package:threedpass/features/poscan_objects_query/bloc/poscan_objects_cubit.dart';
import 'package:threedpass/features/poscan_objects_query/domain/entities/uploaded_object.dart';
import 'package:threedpass/features/wallet_screen/assets_page/widgets/objects_list/objects_list_header_full.dart';
import 'package:threedpass/features/wallet_screen/assets_page/widgets/objects_list/objects_list_item.dart';
import 'package:threedpass/features/wallet_screen/notifications_page/bloc/notifications_bloc.dart';

class UploadedObjectsList extends StatelessWidget {
  const UploadedObjectsList({super.key});

  @override
  Widget build(final BuildContext context) {
    return BlocBuilder<AppServiceLoaderCubit, AppService>(
      builder: (final context, final appService) =>
          BlocBuilder<PoscanObjectsCubit, PoscanObjectsState>(
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
              return const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBoxH16(),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: ObjectsListHeaderFull(),
                  ),
                  Padding16(
                    child: D3pBodyMediumText('no_owned_objects_found'),
                  ),
                ],
              );
            }

            if (relatedObjects.isEmpty) {
              return const SizedBox();
            }

            return Column(
              children: [
                const SizedBoxH16(),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: ObjectsListHeaderFull(),
                ),
                Flexible(
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                    shrinkWrap: true,
                    itemCount: relatedObjects.length,
                    itemBuilder: (final context, final index) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: ObjectsListItem(
                        uploadedObject: relatedObjects[index],
                      ),
                    ),
                  ),
                ),
                if (state.status == PoscanObjectStateStatus.loading)
                  const ThinProgressIndicator(),
              ],
            );
          },
        ),
      ),
    );
  }

  Future<void> reloadCache(final BuildContext context) async {
    final bloc = BlocProvider.of<PoscanObjectsCubit>(context);

    await bloc.clear();
    await bloc.loadAll();
  }

  static bool hasPutObj(final NotificationsState state) {
    final types = state.notifications.map((final e) => e.type).toList();
    return types.contains(NotificationType.putObject);
  }
}
