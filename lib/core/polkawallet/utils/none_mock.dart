import 'package:json_annotation/json_annotation.dart';

part 'none_mock.g.dart';

@JsonSerializable(explicitToJson: true)
class NoneMock {
  Map<String, dynamic> toJson() => _$NoneMockToJson(this);
}

class BigIntWrapper {
  final BigInt value;

  const BigIntWrapper(this.value);

  String toJson() => value.toString();
}
