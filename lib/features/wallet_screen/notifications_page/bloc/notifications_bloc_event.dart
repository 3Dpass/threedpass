part of 'notifications_bloc.dart';

abstract class NotificationsBlocEvent {
  const NotificationsBlocEvent();
}

class AddNotification extends NotificationsBlocEvent {
  final NotificationDTO notification;

  const AddNotification(this.notification);
}

class UpdateNotification extends NotificationsBlocEvent {
  final NotificationDTO oldN;
  final NotificationDTO newN;

  const UpdateNotification({
    required this.newN,
    required this.oldN,
  });
}
