import 'package:json_annotation/json_annotation.dart';

part 'obj_details.g.dart';

@JsonSerializable()
class ObjDetailsPoscanAsset {
  final String objIdx;
  final String propIdx;
  final String maxSupply; // "maxSupply": "1,000"

  const ObjDetailsPoscanAsset({
    required this.maxSupply,
    required this.objIdx,
    required this.propIdx,
  });

  ObjDetailsPoscanAsset.fromSuperTypes({
    required final int objIdx,
    required final int propIdx,
    required final BigInt maxSupply,
  })  : objIdx = objIdx.toString(),
        propIdx = propIdx.toString(),
        maxSupply = maxSupply.toString();

  factory ObjDetailsPoscanAsset.fromJson(final Map<String, dynamic> json) =>
      _$ObjDetailsPoscanAssetFromJson(json);

  Map<String, dynamic> toJson() => _$ObjDetailsPoscanAssetToJson(this);
}
