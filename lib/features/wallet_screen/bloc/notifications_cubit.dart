import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'notifications_cubit.g.dart';

enum NotificationType { transfer, vote }

class NotificationDTO {
  final DateTime? dateTime;
  final List<String>? fromAddresses;
  final List<String>? toAddresses;
  final String? amount;
  final NotificationType type;

  const NotificationDTO({
    required this.type,
    this.amount,
    this.dateTime,
    this.fromAddresses,
    this.toAddresses,
  });
}

@CopyWith()
class NotificationsState {
  final List<NotificationDTO> notifications;
  final bool isLoading;

  const NotificationsState({
    required this.notifications,
    this.isLoading = false,
  });

  const NotificationsState.initial()
      : notifications = const [],
        isLoading = true;
}

class NotificationsCubit extends Cubit<NotificationsState> {
  NotificationsCubit() : super(const NotificationsState.initial());

  Future<void> init() async {}

  void add(NotificationDTO notification) {
    final newList = List<NotificationDTO>.from(state.notifications);
    newList.add(notification);
    emit(state.copyWith(notifications: newList));
  }
}
