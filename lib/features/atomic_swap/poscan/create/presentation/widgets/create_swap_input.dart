part of '../create_swap_page.dart';

class _CreateSwapInput extends StatelessWidget {
  _CreateSwapInput();

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<CreateAtomicSwapCubit>(context);
    final pacState = BlocProvider.of<PoscanAssetsCubit>(context).state;
    final balances = pacState.balances;
    final assets = pacState.balances.keys
        .where((final k) => balances[k]!.decodedRawBalance > BigInt.zero)
        .map(
          (final assetId) => PoolAssetField(
            assetId: assetId,
            isNative: false,
          ),
        )
        .toList();
    return BlocBuilder<CreateAtomicSwapCubit, CreateAtomicSwapState>(
      builder: (BuildContext context, CreateAtomicSwapState state) =>
          PoscanAssetSwapActionInput(
        assetItems: assets,
        controller: bloc.assetAmountController,
        onSelected: (e) => bloc.selectAsset(e.assetId!),
        chosenItem: state.assetId != null
            ? PoolAssetField(isNative: false, assetId: state.assetId!)
            : null,
      ), // TODO Make action input choose only assetIds without native token,
    );
  }
}
