import 'package:json_annotation/json_annotation.dart';
import 'package:polkawallet_sdk/p3d/serializable.dart';

part 'prop_value.g.dart';

@JsonSerializable()
class PropValue implements Serializable {
  @JsonKey(name: 'prop_idx')
  final int propIdx;
  @JsonKey(name: 'max_value')
  final BigInt maxValue;

  const PropValue({
    required this.maxValue,
    required this.propIdx,
  });

  @override
  Map<String, dynamic> toJson() => _$PropValueToJson(this);

  factory PropValue.fromJson(final Map<String, dynamic> json) =>
      _$PropValueFromJson(json);
}
