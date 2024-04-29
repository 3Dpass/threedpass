import 'package:json_annotation/json_annotation.dart';

part 'poscan_token_balance.g.dart';

@JsonSerializable()
class PoscanAssetBalance {
  final String balance;
  // https://support.polkadot.network/support/solutions/articles/65000182717-account-balances-and-locks
  final String reason;
  final String status;

  // Apply [metadata] decimals to get the actual balance
  BigInt get decodedRawBalance => BigInt.parse(balance.replaceAll(',', ''));

  const PoscanAssetBalance({
    required this.balance,
    required this.reason,
    required this.status,
  });

  factory PoscanAssetBalance.fromJson(final Map<String, dynamic> json) =>
      _$PoscanAssetBalanceFromJson(json);
  Map<String, dynamic> toJson() => _$PoscanAssetBalanceToJson(this);
}
