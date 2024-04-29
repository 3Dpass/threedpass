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

  factory ObjDetailsPoscanAsset.fromJson(final Map<String, dynamic> json) =>
      _$ObjDetailsPoscanAssetFromJson(json);

  Map<String, dynamic> toJson() => _$ObjDetailsPoscanAssetToJson(this);
}
