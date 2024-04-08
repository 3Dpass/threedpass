import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:polkawallet_sdk/p3d/serializable.dart';

part 'prop_value.g.dart';

@JsonSerializable(createFactory: false)
class PropValue extends Equatable implements Serializable {
  final int propIdx;
  final BigInt maxValue;

  const PropValue({
    required this.maxValue,
    required this.propIdx,
  });

  @override
  Map<String, dynamic> toJson() => _$PropValueToJson(this);

  factory PropValue.fromJson(final Map<String, dynamic> json) {
    final id = int.parse(json['propIdx'].toString());
    final maxValue =
        BigInt.parse(json['maxValue'].toString().replaceAll(',', ''));
    return PropValue(maxValue: maxValue, propIdx: id);
  }

  @override
  List<Object?> get props => [propIdx, maxValue];
}
