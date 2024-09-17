import 'package:equatable/equatable.dart';

class GetEventsParams extends Equatable {
  final String pageKey;
  final int pageSize;
  final int? blockNumber;
  final int? extrinsicIdx;
  final String? eventModule;
  final String? eventName;

  const GetEventsParams({
    required this.pageKey,
    this.pageSize = 100,
    this.blockNumber,
    this.eventModule,
    this.eventName,
    this.extrinsicIdx,
  });

  @override
  List<Object?> get props => [
        pageKey,
        pageSize,
        blockNumber,
        extrinsicIdx,
        eventModule,
        eventName,
      ];
}
