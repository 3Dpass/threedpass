import 'package:equatable/equatable.dart';

class GetExtrisincsParams extends Equatable {
  final String pageKey;
  final int pageSize;
  final int? blockNumber;
  final int? extrinsicIdx;
  final String? callModule;
  final String? callName;
  final String? multiAddressAccountId;

  const GetExtrisincsParams({
    required this.pageKey,
    this.pageSize = 100,
    this.blockNumber,
    this.callModule,
    this.callName,
    this.extrinsicIdx,
    this.multiAddressAccountId,
  });

  @override
  List<Object?> get props => [
        pageKey,
        pageSize,
        blockNumber,
        callModule,
        callName,
        extrinsicIdx,
        multiAddressAccountId,
      ];
}
