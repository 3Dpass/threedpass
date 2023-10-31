import 'package:polkawallet_sdk/plugin/store/balances.dart';

abstract class TransferMetaDTO {
  const TransferMetaDTO({
    required this.decimals,
    required this.name,
  });

  final int decimals;
  final String name;

  MetaInfoType get type;
}

class CoinsTransferMetaDTO extends TransferMetaDTO {
  const CoinsTransferMetaDTO({
    required super.name,
    required super.decimals,
  });

  @override
  final MetaInfoType type = MetaInfoType.coin;
}

class AssetTransferMetaDTO extends TransferMetaDTO {
  const AssetTransferMetaDTO({
    required super.name,
    required super.decimals,
    required this.tokenBalanceData,
  });

  final TokenBalanceData tokenBalanceData;

  @override
  final MetaInfoType type = MetaInfoType.asset;
}

enum MetaInfoType { asset, coin }
