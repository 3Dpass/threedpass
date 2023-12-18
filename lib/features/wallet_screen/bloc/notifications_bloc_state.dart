part of 'notifications_bloc.dart';

enum NotificationType { transfer, putObject }

abstract class NotificationDTO {
  final DateTime notificationCreated = DateTime.now().toUtc();
  final ExtrisincStatus status;
  final String? message;

  NotificationDTO({
    required this.status,
    required this.message,
  });

  NotificationType get type;
}

@CopyWith()
class NotificationTransfer extends NotificationDTO {
  final String fromAddress;
  final String toAddress;
  final String amount;
  final String symbols;
  final DateTime? blockDateTime;

  NotificationTransfer({
    required this.amount,
    required this.fromAddress,
    required this.symbols,
    required this.toAddress,
    required super.message,
    required super.status,
    required this.blockDateTime,
  });

  @override
  final NotificationType type = NotificationType.transfer;
}

@CopyWith()
class NotificationPutObject extends NotificationDTO {
  final String localSnapshotName;
  final KeyPairData account;

  NotificationPutObject({
    required this.account,
    required this.localSnapshotName,
    required super.status,
    required super.message,
  });

  @override
  final NotificationType type = NotificationType.putObject;
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
