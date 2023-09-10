// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notifications_cubit.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$NotificationDTOCWProxy {
  NotificationDTO type(NotificationType type);

  NotificationDTO status(ExtrisincStatus status);

  NotificationDTO amount(String? amount);

  NotificationDTO fromAddresses(List<String>? fromAddresses);

  NotificationDTO toAddresses(List<String>? toAddresses);

  NotificationDTO message(String? message);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `NotificationDTO(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// NotificationDTO(...).copyWith(id: 12, name: "My name")
  /// ````
  NotificationDTO call({
    NotificationType? type,
    ExtrisincStatus? status,
    String? amount,
    List<String>? fromAddresses,
    List<String>? toAddresses,
    String? message,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfNotificationDTO.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfNotificationDTO.copyWith.fieldName(...)`
class _$NotificationDTOCWProxyImpl implements _$NotificationDTOCWProxy {
  const _$NotificationDTOCWProxyImpl(this._value);

  final NotificationDTO _value;

  @override
  NotificationDTO type(NotificationType type) => this(type: type);

  @override
  NotificationDTO status(ExtrisincStatus status) => this(status: status);

  @override
  NotificationDTO amount(String? amount) => this(amount: amount);

  @override
  NotificationDTO fromAddresses(List<String>? fromAddresses) =>
      this(fromAddresses: fromAddresses);

  @override
  NotificationDTO toAddresses(List<String>? toAddresses) =>
      this(toAddresses: toAddresses);

  @override
  NotificationDTO message(String? message) => this(message: message);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `NotificationDTO(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// NotificationDTO(...).copyWith(id: 12, name: "My name")
  /// ````
  NotificationDTO call({
    Object? type = const $CopyWithPlaceholder(),
    Object? status = const $CopyWithPlaceholder(),
    Object? amount = const $CopyWithPlaceholder(),
    Object? fromAddresses = const $CopyWithPlaceholder(),
    Object? toAddresses = const $CopyWithPlaceholder(),
    Object? message = const $CopyWithPlaceholder(),
  }) {
    return NotificationDTO(
      type: type == const $CopyWithPlaceholder() || type == null
          ? _value.type
          // ignore: cast_nullable_to_non_nullable
          : type as NotificationType,
      status: status == const $CopyWithPlaceholder() || status == null
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as ExtrisincStatus,
      amount: amount == const $CopyWithPlaceholder()
          ? _value.amount
          // ignore: cast_nullable_to_non_nullable
          : amount as String?,
      fromAddresses: fromAddresses == const $CopyWithPlaceholder()
          ? _value.fromAddresses
          // ignore: cast_nullable_to_non_nullable
          : fromAddresses as List<String>?,
      toAddresses: toAddresses == const $CopyWithPlaceholder()
          ? _value.toAddresses
          // ignore: cast_nullable_to_non_nullable
          : toAddresses as List<String>?,
      message: message == const $CopyWithPlaceholder()
          ? _value.message
          // ignore: cast_nullable_to_non_nullable
          : message as String?,
    );
  }
}

extension $NotificationDTOCopyWith on NotificationDTO {
  /// Returns a callable class that can be used as follows: `instanceOfNotificationDTO.copyWith(...)` or like so:`instanceOfNotificationDTO.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$NotificationDTOCWProxy get copyWith => _$NotificationDTOCWProxyImpl(this);
}

abstract class _$NotificationsStateCWProxy {
  NotificationsState notifications(List<NotificationDTO> notifications);

  NotificationsState isLoading(bool isLoading);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `NotificationsState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// NotificationsState(...).copyWith(id: 12, name: "My name")
  /// ````
  NotificationsState call({
    List<NotificationDTO>? notifications,
    bool? isLoading,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfNotificationsState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfNotificationsState.copyWith.fieldName(...)`
class _$NotificationsStateCWProxyImpl implements _$NotificationsStateCWProxy {
  const _$NotificationsStateCWProxyImpl(this._value);

  final NotificationsState _value;

  @override
  NotificationsState notifications(List<NotificationDTO> notifications) =>
      this(notifications: notifications);

  @override
  NotificationsState isLoading(bool isLoading) => this(isLoading: isLoading);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `NotificationsState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// NotificationsState(...).copyWith(id: 12, name: "My name")
  /// ````
  NotificationsState call({
    Object? notifications = const $CopyWithPlaceholder(),
    Object? isLoading = const $CopyWithPlaceholder(),
  }) {
    return NotificationsState(
      notifications:
          notifications == const $CopyWithPlaceholder() || notifications == null
              ? _value.notifications
              // ignore: cast_nullable_to_non_nullable
              : notifications as List<NotificationDTO>,
      isLoading: isLoading == const $CopyWithPlaceholder() || isLoading == null
          ? _value.isLoading
          // ignore: cast_nullable_to_non_nullable
          : isLoading as bool,
    );
  }
}

extension $NotificationsStateCopyWith on NotificationsState {
  /// Returns a callable class that can be used as follows: `instanceOfNotificationsState.copyWith(...)` or like so:`instanceOfNotificationsState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$NotificationsStateCWProxy get copyWith =>
      _$NotificationsStateCWProxyImpl(this);
}
