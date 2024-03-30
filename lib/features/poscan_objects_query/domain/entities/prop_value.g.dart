// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prop_value.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PropValue _$PropValueFromJson(Map<String, dynamic> json) => PropValue(
      maxValue: BigInt.parse(json['max_value'] as String),
      propIdx: json['prop_idx'] as int,
    );

Map<String, dynamic> _$PropValueToJson(PropValue instance) => <String, dynamic>{
      'prop_idx': instance.propIdx,
      'max_value': instance.maxValue.toString(),
    };
