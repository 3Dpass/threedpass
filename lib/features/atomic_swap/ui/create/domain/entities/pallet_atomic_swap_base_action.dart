abstract class PalletAtomicSwapBaseAction {
  const PalletAtomicSwapBaseAction();
}

class PalletAtomicSwapBalanceSwapAction extends PalletAtomicSwapBaseAction {
  final BigInt action;

  const PalletAtomicSwapBalanceSwapAction(this.action);
}

class PalletPoscanAssetsSwapTokenSwapAction extends PalletAtomicSwapBaseAction {
  final int assetId;
  final double value;

  const PalletPoscanAssetsSwapTokenSwapAction({
    required this.assetId,
    required this.value,
  });
}
