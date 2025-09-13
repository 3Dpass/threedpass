import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/utils/when_widget.dart';
import 'package:threedpass/core/widgets/other/ph16.dart';
import 'package:threedpass/features/poscan_objects_query/bloc/user_objects_list_cubit.dart';
import 'package:threedpass/features/poscan_objects_query/domain/entities/uploaded_object.dart';
import 'package:threedpass/features/wallet_screen/assets_page/widgets/objects_list/objects_list_empty_refresh_widget.dart';
import 'package:threedpass/features/wallet_screen/assets_page/widgets/objects_list/objects_list_header_full.dart';
import 'package:threedpass/features/wallet_screen/assets_page/widgets/objects_list/objects_list_pure.dart';
import 'package:threedpass/features/wallet_screen/notifications_page/bloc/notifications_bloc.dart';

class ObjectsListAssets extends StatelessWidget {
  const ObjectsListAssets({super.key});

  @override
  Widget build(final BuildContext context) {
    return BlocBuilder<UserObjectsListCubit, UserObjectsListState>(
      builder: (final context, final userObjListState) =>
          BlocBuilder<NotificationsBloc, NotificationsState>(
        builder: (final context, final notifState) =>
            userObjListState.whenWidget(
          data: (final List<UploadedObject> objList) {
            if (objList.isEmpty && notifState.hasPutObj()) {
              return const ObjectsListEmptyRefresh();
            }
            return Column(
              spacing: 8,
              mainAxisSize: MainAxisSize.min,
              children: [
                const PH16(child: UserObjectsListHeaderFull()),
                Flexible(
                  child: ObjectsListPure(
                    objects: objList,
                  ),
                )
              ],
            );
          },
        ),
        buildWhen: (final previous, final current) =>
            previous.hasPutObj() != current.hasPutObj(),
      ),
    );
  }
}
