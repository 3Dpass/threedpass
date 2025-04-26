abstract class PalletAtomicSwapBaseAction {
  const PalletAtomicSwapBaseAction();

  bool get isPoscan;
}

class PalletAtomicSwapBalanceSwapAction extends PalletAtomicSwapBaseAction {
  final BigInt action;
  @override
  final bool isPoscan = false;

  const PalletAtomicSwapBalanceSwapAction(this.action);
}

class PalletPoscanAssetsSwapTokenSwapAction extends PalletAtomicSwapBaseAction {
  final int assetId;
  final double value;

  @override
  final bool isPoscan = true;

  const PalletPoscanAssetsSwapTokenSwapAction({
    required this.assetId,
    required this.value,
  });
}
