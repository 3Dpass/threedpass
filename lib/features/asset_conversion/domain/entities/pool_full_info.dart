import 'package:threedpass/features/asset_conversion/domain/entities/basic_pool_entity.dart';
import 'package:threedpass/features/asset_conversion/domain/entities/lp_balance.dart';
import 'package:threedpass/features/asset_conversion/domain/entities/raw_pool_reserve.dart';

class PoolFullInfo {
  final BasicPoolEntity basicInfo;
  final RawPoolReserve rawPoolReserve;
  final LPBalance lpBalance;

  const PoolFullInfo({
    required this.basicInfo,
    required this.lpBalance,
    required this.rawPoolReserve,
  });
}
