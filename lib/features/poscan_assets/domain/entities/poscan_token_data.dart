import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:threedpass/features/poscan_assets/bloc/poscan_assets_cubit.dart';
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

  int get minBalanceInt => int.parse(minBalance.replaceAll(',', ''));

  factory PoscanAssetData.fromJson(final Map<String, dynamic> json) =>
      _$PoscanAssetDataFromJson(json);
  Map<String, dynamic> toJson() => _$PoscanAssetDataToJson(this);
}

extension PTD on PoscanAssetData {
  String foldAssetInfo(
    final BuildContext context,
    // final PoscanAssetData data,
    // final PoscanAssetMetadata? metadata,
  ) {
    final metadata =
        BlocProvider.of<PoscanAssetsCubit>(context).state.metadata[id];

    if (metadata == null) {
      return 'id: ${id}';
    } else {
      return '${metadata.name}';
    }
  }
}
