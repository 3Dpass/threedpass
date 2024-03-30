import 'package:threedpass/features/poscan_objects_query/domain/entities/prop_value.dart';

class PoscanProperty {
  final String name;
  final PropValue propValue;

  const PoscanProperty({
    required this.name,
    required this.propValue,
  });

  @override
  bool operator ==(final Object other) {
    if (other is! PoscanProperty) return false;
    return other.propValue.propIdx == this.propValue.propIdx;
  }

  @override
  int get hashCode => propValue.propIdx.hashCode;

  PoscanProperty copyWith({final BigInt? maxValue}) {
    final newPropValue = maxValue != null
        ? PropValue(maxValue: maxValue, propIdx: this.propValue.propIdx)
        : this.propValue;

    return PoscanProperty(
      name: this.name,
      propValue: newPropValue,
    );
  }
}
