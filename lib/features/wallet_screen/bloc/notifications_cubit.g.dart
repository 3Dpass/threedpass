// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notifications_cubit.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

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
