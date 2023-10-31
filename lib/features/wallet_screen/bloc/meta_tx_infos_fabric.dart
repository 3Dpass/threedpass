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
    required final TokenBalanceData? tbd,
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
      return AssetsTransferTx(
        decimals: metaDTO.decimals,
        senderData: senderData,
        amount: amount,
        toAddress: toAddress,
        transferType: state.transactionOption,
        tokenBalanceData: tbd,
      );
    }
  }

  List<TransferTxInfoI> oneToOne(final TokenBalanceData? tbd) {
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

  List<TransferTxInfoI> oneToMany(final TokenBalanceData? tbd) {
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

  List<TransferTxInfoI> manyToOne(final TokenBalanceData? tbd) {
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

  List<TransferTxInfoI> buildList(final TokenBalanceData? tbd) {
    final res = <TransferTxInfoI>[];
    caseSplit(
      txInfos: state.fromAddresses,
      params: state.toAddresses,
      passwords: state.fromAddresses,
      onFirst: () {
        final tmp = oneToOne(tbd);
        res.addAll(tmp);
      },
      onSecond: () {
        final tmp = oneToMany(tbd);
        res.addAll(tmp);
      },
      onThird: () {
        final tmp = manyToOne(tbd);
        res.addAll(tmp);
      },
      onError: () {
        throw Exception('Something went wrong');
      },
    );
    return res;
  }

  List<TransferTxInfoI> build() {
    switch (metaDTO.type) {
      case MetaInfoType.coin:
        return buildList(null);
      case MetaInfoType.asset:
        final amDTO = metaDTO as AssetTransferMetaDTO;
        return buildList(amDTO.tokenBalanceData);
    }
  }
}
