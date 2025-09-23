import 'package:json_annotation/json_annotation.dart';

part 'block_response.g.dart';

@JsonSerializable(createToJson: false)
class BlockResponse {
  final int time;
  final bool isFinalized;

  const BlockResponse({
    required this.time,
    required this.isFinalized,
  });

  factory BlockResponse.fromJson(Map<String, dynamic> json) =>
      _$BlockResponseFromJson(json);
}
