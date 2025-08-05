class RawPendingPoscanAtomicSwapAction {
  final int assetId;
  final BigInt value;

  const RawPendingPoscanAtomicSwapAction({
    required this.assetId,
    required this.value,
  });

  factory RawPendingPoscanAtomicSwapAction.fromJson(
          final Map<String, dynamic> json) =>
      RawPendingPoscanAtomicSwapAction(
        assetId: json['assetId'],
        value: BigInt.parse(json['value'].toString()),
      );
}

class RawPendingPoscanAtomicSwapData {
  final String keyHash;
  final String source;
  final RawPendingPoscanAtomicSwapAction action;
  final int endBlock;

  const RawPendingPoscanAtomicSwapData({
    required this.keyHash,
    required this.source,
    required this.action,
    required this.endBlock,
  });

  factory RawPendingPoscanAtomicSwapData.fromRaw(final List<dynamic> rawData) {
    return RawPendingPoscanAtomicSwapData(
      keyHash: rawData[0],
      source: rawData[1]['source'],
      action: RawPendingPoscanAtomicSwapAction.fromJson(rawData[1]['action']),
      endBlock: rawData[1]['endBlock'],
    );
  }
}
