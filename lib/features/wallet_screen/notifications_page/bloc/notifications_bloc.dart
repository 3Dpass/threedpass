import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:polkawallet_sdk/storage/types/keyPairData.dart';
import 'package:threedpass/core/polkawallet/utils/extrinsic_status.dart';
import 'package:threedpass/core/utils/logger.dart';
import 'package:threedpass/features/asset_conversion/domain/entities/basic_pool_entity.dart';
import 'package:threedpass/features/asset_conversion/domain/use_cases/add_liquidity.dart';
import 'package:threedpass/features/asset_conversion/domain/use_cases/remove_liquidity.dart';
import 'package:threedpass/features/asset_conversion/domain/use_cases/swap_assets.dart';
import 'package:threedpass/features/poscan_assets/domain/entities/obj_details.dart';

part 'notifications_bloc.g.dart';
part 'notifications_bloc_state.dart';
part 'notifications_bloc_event.dart';

class NotificationsBloc
    extends Bloc<NotificationsBlocEvent, NotificationsState> {
  NotificationsBloc() : super(const NotificationsState.initial()) {
    on<AddNotification>(_addNotification);
    on<UpdateNotification>(_updateNotification);
  }

  void _addNotification(
    final AddNotification event,
    final Emitter<NotificationsState> emit,
  ) {
    final newList = List<NotificationDTO>.of(state.notifications);
    newList.insert(0, event.notification);
    emit(state.copyWith(notifications: newList));
  }

  void _updateNotification(
    final UpdateNotification event,
    final Emitter<NotificationsState> emit,
  ) {
    final newList = List<NotificationDTO>.of(state.notifications);
    final index = newList.indexOf(event.oldN);
    if (index == -1) {
      logger.e(
        'Notifications was not found in list. N=${event.oldN} ${event.oldN}, L=${newList.length}',
      );
      return;
    }
    newList[index] = event.newN;
    emit(state.copyWith(notifications: newList));
  }
}
