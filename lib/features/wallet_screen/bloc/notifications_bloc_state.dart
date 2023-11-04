part of 'notifications_bloc.dart';

enum NotificationType { transfer, vote }

@CopyWith()
class NotificationDTO extends Equatable {
  final String? fromAddress;
  final String? toAddress;
  final String? amount;
  final NotificationType type;
  final ExtrisincStatus status;
  final String? message;
  final String? symbols;
  final DateTime? blockDateTime;
  final DateTime notificationCreated = DateTime.now().toUtc();

  NotificationDTO({
    required this.type,
    required this.status,
    required this.amount,
    this.fromAddress,
    this.toAddress,
    this.message,
    this.symbols,
    this.blockDateTime,
  });

  @override
  List<Object?> get props => [
        notificationCreated,
        fromAddress,
        toAddress,
        amount,
      ];
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
