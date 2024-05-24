part of 'transfer_info_bloc.dart';

class _MetaTxInfosFabric {
  const _MetaTxInfosFabric({
    required this.metaDTO,
    required this.state,
  });

  final TransferInfoBlocState state;
  final TransferMetaDTO metaDTO;

  TransferTxInfoI buildTransferTxInfoI({
    required final int decimals,
    required final KeyPairData senderData,
    required final double amount,
    required final String toAddress,
    required final BalanceTransactionType transferType,
    required final AssetTransferMetaDTO? tbd,
  }) {
    if (tbd == null) {
      return CoinsTransferTx(
        decimals: metaDTO.decimals,
        senderData: senderData,
        amount: amount,
        toAddress: toAddress,
        transferType: state.transactionOption,
      );
    } else {
      return PoscanAssetsTransferTx(
        decimals: metaDTO.decimals,
        senderData: senderData,
        amount: amount,
        toAddress: toAddress,
        transferType: state.transactionOption,
        assetTransferMetaDTO: tbd,
        // tokenBalanceData: TokenBalanceData(),
      );
    }
  }

  List<TransferTxInfoI> oneToOne(final AssetTransferMetaDTO? tbd) {
    final res = <TransferTxInfoI>[];
    final from = state.fromAddresses.first;
    final amount = state.amounts.first;
    final to = state.toAddresses.first;

    if (from.data == null) {
      throw Exception('The only FROM address is null');
    }

    final amountD = double.tryParse(amount.amountController.text);
    if (amountD == null) {
      throw Exception("Couldn't parse amount");
    }

    res.add(
      buildTransferTxInfoI(
        decimals: metaDTO.decimals,
        senderData: from.data!,
        amount: amountD,
        toAddress: to.toAddressController.text,
        transferType: state.transactionOption,
        tbd: tbd,
      ),
    );
    return res;
  }

  List<TransferTxInfoI> oneToMany(final AssetTransferMetaDTO? tbd) {
    final res = <TransferTxInfoI>[];

    if (state.toAddresses.length != state.amounts.length) {
      throw Exception(
        'The number of TO addresses must be equal to the number of amounts',
      );
    }

    final from = state.fromAddresses.first;
    if (from.data == null) {
      throw Exception('The only FROM address is null');
    }

    for (var i = 0; i < state.toAddresses.length; i++) {
      final amount = state.amounts[i];
      final to = state.toAddresses[i];

      final amountD = double.tryParse(amount.amountController.text);
      if (amountD == null) {
        throw Exception("Couldn't parse amount");
      }

      res.add(
        buildTransferTxInfoI(
          decimals: metaDTO.decimals,
          senderData: from.data!,
          amount: amountD,
          toAddress: to.toAddressController.text,
          transferType: state.transactionOption,
          tbd: tbd,
        ),
      );
    }

    return res;
  }

  List<TransferTxInfoI> manyToOne(final AssetTransferMetaDTO? tbd) {
    final res = <TransferTxInfoI>[];

    if (state.fromAddresses.length != state.amounts.length) {
      throw Exception(
        'The number of FROM addresses must be equal to the number of amounts',
      );
    }

    final toAddress = state.toAddresses.first.toAddressController.text;

    for (var i = 0; i < state.fromAddresses.length; i++) {
      final from = state.fromAddresses[i];
      if (from.data == null) {
        throw Exception('The FROM address [$i] is null');
      }

      final amount = state.amounts[i];
      final amountD = double.tryParse(amount.amountController.text);
      if (amountD == null) {
        throw Exception("Couldn't parse amount");
      }

      res.add(
        buildTransferTxInfoI(
          decimals: metaDTO.decimals,
          senderData: from.data!,
          amount: amountD,
          toAddress: toAddress,
          transferType: state.transactionOption,
          tbd: tbd,
        ),
      );
    }

    return res;
  }

  List<TransferTxInfoI> buildList(final AssetTransferMetaDTO? tbd) {
    // final res = <TransferTxInfoI>[];
    switch (state.transferType) {
      case TransferType.manyToOne:
        return manyToOne(tbd);
      case TransferType.oneToOne:
        return oneToOne(tbd);
      case TransferType.oneToMany:
        return oneToMany(tbd);
    }
  }

  List<TransferTxInfoI> build() {
    switch (metaDTO.type) {
      case MetaInfoType.coin:
        return buildList(null);
      case MetaInfoType.asset:
        final amDTO = metaDTO as AssetTransferMetaDTO;
        return buildList(amDTO);
    }
  }
}

// VERY BAD CODE. But there is no easy workaround
// Delete this when possible
class PoscanAssetsTransferTx extends TransferTxInfoI {
  PoscanAssetsTransferTx({
    required super.decimals,
    required super.senderData,
    required super.amount,
    required super.toAddress,
    required super.transferType,
    // required super.legacyTokenBalanceData,
    required this.assetTransferMetaDTO,
  });

  final AssetTransferMetaDTO assetTransferMetaDTO;

  @override
  TxInfoData txInfo() => TxInfoData(
        'poscanAssets',
        BalanceTransactionTypeValue(transferType).toString(),
        TxSenderData(senderData.address, senderData.pubKey),
      );

  @override
  TxParams params() {
    return PoscanAssetsTxParams(
      amount: amount,
      toAddress: toAddress,
      assetData: assetTransferMetaDTO,
      // tokenBalanceData: tokenBalanceData,
    );
  }
}

class PoscanAssetsTxParams extends TxParams {
  const PoscanAssetsTxParams({
    required this.amount,
    required this.toAddress,
    required this.assetData,
    // required this.tokenBalanceData,
  });

  final AssetTransferMetaDTO assetData;
  @override
  final double amount;
  @override
  final String toAddress;

  @override
  List<String> paramsToSend() {
    // https://polkadot.js.org/docs/substrate/extrinsics/#transferid-compactu32-target-multiaddress-amount-compactu128
    final realAmount = BalanceUtils.tokenInt(
      amount.toString(),
      assetData.decimals,
    );

    return [
      assetData.assetId.toString(),
      // params.to
      toAddress,
      // params.amount
      realAmount.toString(),
    ];
  }

  @override
  TxParamsType get type => TxParamsType.assets;
}
