import 'package:equatable/equatable.dart';

class PropValue extends Equatable {
  final int propIdx;
  final BigInt maxValue;

  const PropValue({
    required this.maxValue,
    required this.propIdx,
  });

  factory PropValue.fromJson(final Map<String, dynamic> json) {
    final id = int.parse(json['propIdx'].toString());
    final maxValue =
        BigInt.parse(json['maxValue'].toString().replaceAll(',', ''));
    return PropValue(maxValue: maxValue, propIdx: id);
  }

  @override
  List<Object?> get props => [propIdx, maxValue];
}
