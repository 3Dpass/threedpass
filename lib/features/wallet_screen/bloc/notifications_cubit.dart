import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/features/wallet_screen/domain/entities/transfer_history_ui.dart';

part 'notifications_cubit.g.dart';

enum NotificationType { transfer, vote }

@CopyWith()
class NotificationDTO {
  final String? fromAddress;
  final String? toAddress;
  final String? amount;
  final NotificationType type;
  final ExtrisincStatus status;
  final String? message;
  final String? symbols;
  final DateTime? blockDateTime;

  const NotificationDTO({
    required this.type,
    required this.status,
    required this.amount,
    this.fromAddress,
    this.toAddress,
    this.message,
    this.symbols,
    this.blockDateTime,
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

  Future<void> init() async {
    // final test = [
    //   const NotificationDTO(
    //     amount: '1231.23 P3D',
    //     fromAddresses: ['d1D8TcfAy9UWY92uFsoeiMKCvyTgLgUPvyM5gMrBGtWY86oxF'],
    //     toAddresses: ['d1D8TcfAy9UWY92uFsoeiMKCvyTgLgUPvyM5gMrBGtWY86oxF'],
    //     status: ExtrisincStatus.loading,
    //     type: NotificationType.transfer,
    //     symbols: 'P3D',
    //   ),
    //   const NotificationDTO(
    //     amount: '1231.23 P3D',
    //     fromAddresses: ['d1D8TcfAy9UWY92uFsoeiMKCvyTgLgUPvyM5gMrBGtWY86oxF'],
    //     toAddresses: ['d1D8TcfAy9UWY92uFsoeiMKCvyTgLgUPvyM5gMrBGtWY86oxF'],
    //     status: ExtrisincStatus.success,
    //     type: NotificationType.transfer,
    //     symbols: 'P3D',
    //   ),
    //   const NotificationDTO(
    //     amount: '1231.23 P3D',
    //     fromAddresses: ['d1D8TcfAy9UWY92uFsoeiMKCvyTgLgUPvyM5gMrBGtWY86oxF'],
    //     toAddresses: ['d1D8TcfAy9UWY92uFsoeiMKCvyTgLgUPvyM5gMrBGtWY86oxF'],
    //     status: ExtrisincStatus.failed,
    //     type: NotificationType.transfer,
    //     symbols: 'P3D',
    //   ),
    // ];

    // final newList = List<NotificationDTO>.from(state.notifications);
    // newList.addAll(test);
    // emit(state.copyWith(notifications: newList));
  }

  void add(final NotificationDTO notification) {
    final newList = List<NotificationDTO>.from(state.notifications);
    newList.insert(0, notification);
    emit(state.copyWith(notifications: newList));
  }

  void replace(final NotificationDTO oldN, final NotificationDTO newN) {
    final newList = List<NotificationDTO>.from(state.notifications);
    newList[newList.indexOf(oldN)] = newN;
    emit(state.copyWith(notifications: newList));
  }
}
