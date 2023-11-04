import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/features/wallet_screen/domain/entities/transfer_history_ui.dart';

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
    final newList = List<NotificationDTO>.from(state.notifications);
    newList.insert(0, event.notification);
    emit(state.copyWith(notifications: newList));
  }

  void _updateNotification(
    final UpdateNotification event,
    final Emitter<NotificationsState> emit,
  ) {
    final newList = List<NotificationDTO>.from(state.notifications);
    newList[newList.indexOf(event.oldN)] = event.newN;
    emit(state.copyWith(notifications: newList));
  }
}
