import 'package:equatable/equatable.dart';

class GetTransfersParams extends Equatable {
  final String pageKey;
  final int pageSize;
  final String? toMultiAddressAccountId;
  final String? fromMultiAddressAccountId;

  const GetTransfersParams({
    required this.pageKey,
    this.pageSize = 25,
    this.toMultiAddressAccountId,
    this.fromMultiAddressAccountId,
  });

  @override
  List<Object?> get props => [
        pageKey,
        pageSize,
        toMultiAddressAccountId,
        fromMultiAddressAccountId,
      ];
}
