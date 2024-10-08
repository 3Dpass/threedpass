// ignore_for_file: avoid_dynamic_calls

import 'package:equatable/equatable.dart';

class BasicPoolEntity {
  final PoolAssetField firstAsset;
  final PoolAssetField secondAsset;
  final int lpTokenId;

  const BasicPoolEntity({
    required this.firstAsset,
    required this.secondAsset,
    required this.lpTokenId,
  });

  BasicPoolEntity.fromJson(final List<dynamic> json)
      : firstAsset = json[0][0] == 'Native'
            ? const PoolAssetField(isNative: true, assetId: null)
            : PoolAssetField(
                isNative: false,
                assetId: int.parse(json[0][0]['Asset'].toString()),
              ),
        secondAsset = json[0][1] == 'Native'
            ? const PoolAssetField(isNative: true, assetId: null)
            : PoolAssetField(
                isNative: false,
                assetId: int.parse(json[0][1]['Asset'].toString()),
              ),
        lpTokenId = int.parse(json[1]['lpToken'].toString());
}

class PoolAssetField extends Equatable {
  final bool isNative;
  final int? assetId;

  const PoolAssetField({
    required this.isNative,
    required this.assetId,
  });

  const PoolAssetField.native()
      : isNative = true,
        assetId = null;

  @override
  List<Object?> get props => [isNative, assetId];
}
