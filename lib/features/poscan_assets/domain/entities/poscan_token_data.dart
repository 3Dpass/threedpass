import 'package:json_annotation/json_annotation.dart';
import 'package:threedpass/features/poscan_assets/domain/entities/obj_details.dart';

part 'poscan_token_data.g.dart';

@JsonSerializable()
class PoscanAssetData {
  final int id;
  final String owner;
  final String issuer;
  final String admin;
  final String freezer;
  final String supply;
  final String deposit; // "deposit": "100,000,000,000,000",
  final String minBalance;
  final bool isSufficient;
  final String accounts;
  final String sufficients;
  final String approvals;
  final String status;
  final ObjDetailsPoscanAsset? objDetails;
  final String reserved;

  const PoscanAssetData({
    required this.id,
    required this.owner,
    required this.issuer,
    required this.admin,
    required this.freezer,
    required this.supply,
    required this.deposit,
    required this.minBalance,
    required this.isSufficient,
    required this.accounts,
    required this.sufficients,
    required this.approvals,
    required this.status,
    required this.objDetails,
    required this.reserved,
  });

  factory PoscanAssetData.fromJson(final Map<String, dynamic> json) =>
      _$PoscanAssetDataFromJson(json);
  Map<String, dynamic> toJson() => _$PoscanAssetDataToJson(this);
}
