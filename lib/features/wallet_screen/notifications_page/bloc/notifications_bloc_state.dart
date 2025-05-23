part of 'notifications_bloc.dart';

enum NotificationType {
  transfer,
  transferBatch,
  putObject,
  createAsset,
  setMetadata,
  mintAsset,
  createPool,
  addLiquidity,
  removeLiquidity,
  swapAssets,
  createAtomicSwap,
}

abstract class NotificationDTO {
  final DateTime notificationCreated = DateTime.now().toUtc();
  final ExtrinsicStatus status;
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
class NotificationTransferBatch extends NotificationDTO {
  final String fromAddress;
  final List<String> toAddress;
  final List<String> amount;
  final String symbols;
  final DateTime? blockDateTime;

  NotificationTransferBatch({
    required this.amount,
    required this.fromAddress,
    required this.symbols,
    required this.toAddress,
    required super.message,
    required super.status,
    required this.blockDateTime,
  });

  @override
  final NotificationType type = NotificationType.transferBatch;
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

// @CopyWith()
class NotificationCreateAsset extends NotificationDTO {
  final String newAssetId;
  final ObjDetailsPoscanAsset? objDetails;
  final KeyPairData admin;

  NotificationCreateAsset({
    required this.admin,
    required this.newAssetId,
    required this.objDetails,
    required super.status,
    required super.message,
  });

  // There is a bug. CopyWith is not generated for [ObjDetailsPoscanAsset?]
  NotificationCreateAsset copyWith({
    final String? newAssetId,
    final ObjDetailsPoscanAsset? objDetails,
    final KeyPairData? admin,
    final ExtrinsicStatus? status,
    final String? message,
  }) {
    return NotificationCreateAsset(
      admin: admin ?? this.admin,
      newAssetId: newAssetId ?? this.newAssetId,
      objDetails: objDetails ?? this.objDetails,
      status: status ?? this.status,
      message: message ?? this.message,
    );
  }

  @override
  final NotificationType type = NotificationType.createAsset;
}

@CopyWith()
class NotificationSetMetadata extends NotificationDTO {
  final String assetId;
  final KeyPairData admin;

  NotificationSetMetadata({
    required this.admin,
    required this.assetId,
    required super.status,
    required super.message,
  });

  @override
  final NotificationType type = NotificationType.setMetadata;
}

@CopyWith()
class NotificationMintAsset extends NotificationDTO {
  final String assetId;
  final KeyPairData admin;

  NotificationMintAsset({
    required this.admin,
    required this.assetId,
    required super.status,
    required super.message,
  });

  @override
  final NotificationType type = NotificationType.mintAsset;
}

@CopyWith()
class NotificationCreatePool extends NotificationDTO {
  final PoolAssetField asset1;
  final PoolAssetField asset2;
  final KeyPairData admin;

  NotificationCreatePool({
    required this.admin,
    required this.asset1,
    required this.asset2,
    required super.status,
    required super.message,
  });

  @override
  final NotificationType type = NotificationType.createPool;
}

@CopyWith()
class NotificationAddLiquidity extends NotificationDTO {
  final AddLiquidityParams params;

  NotificationAddLiquidity({
    required this.params,
    required super.status,
    required super.message,
  });

  @override
  final NotificationType type = NotificationType.addLiquidity;
}

@CopyWith()
class NotificationRemoveLiquidity extends NotificationDTO {
  final RemoveLiquidityParams params;

  NotificationRemoveLiquidity({
    required this.params,
    required super.status,
    required super.message,
  });

  @override
  final NotificationType type = NotificationType.removeLiquidity;
}

@CopyWith()
class NotificationSwapAssets extends NotificationDTO {
  final SwapAssetsParams params;

  NotificationSwapAssets({
    required this.params,
    required super.status,
    required super.message,
  });

  @override
  final NotificationType type = NotificationType.swapAssets;
}

@CopyWith()
class NotificationCreateAtomicSwap extends NotificationDTO {
  final KeyPairData from;
  final KeyPairData to;
  final bool isPoscan;

  NotificationCreateAtomicSwap({
    required this.from,
    required this.to,
    required super.status,
    required super.message,
    required this.isPoscan,
  });

  @override
  final NotificationType type = NotificationType.createAtomicSwap;
}

@CopyWith()
class NotificationsState {
  final List<NotificationDTO> notifications;
  @Deprecated('Use AsyncValue')
  final bool isLoading;

  const NotificationsState({
    required this.notifications,
    this.isLoading = false,
  });

  const NotificationsState.initial()
      : notifications = const [],
        isLoading = true;
}
