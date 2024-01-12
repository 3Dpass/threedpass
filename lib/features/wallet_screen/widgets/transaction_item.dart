import 'package:flutter/material.dart';
import 'package:threedpass/core/widgets/paddings.dart';
import 'package:threedpass/core/widgets/text/d3p_body_large_text.dart';
import 'package:threedpass/features/wallet_screen/transfer_page/domain/entities/transfer_history_ui.dart';
import 'package:threedpass/features/wallet_screen/widgets/block_datetime_w.dart';
import 'package:threedpass/features/wallet_screen/widgets/extrinsic_status_icon.dart';
import 'package:threedpass/features/wallet_screen/widgets/short_address.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({
    required this.object,
    super.key,
  });

  final TransferHistoryUI object;

  @override
  Widget build(final BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBoxH8(),
        _AmountRow(object),
        const SizedBoxH8(),
        ShortAddress(
          prefix: 'From:',
          address: object.fromAddress,
          colorSecondary: object.direction == TransferDirection.from,
        ),
        const SizedBoxH4(),
        ShortAddress(
          prefix: 'To:',
          address: object.toAddress,
          colorSecondary: object.direction == TransferDirection.to,
        ),
        const SizedBoxH8(),
        BlockDateTimeW(
          object.blockDateTime,
          // object.autoGeneratedObject.blockDatetime!),
        ),
      ],
    );
  }
}

class _AmountRow extends StatelessWidget {
  final TransferHistoryUI object;

  const _AmountRow(this.object);

  @override
  Widget build(final BuildContext context) {
    return Row(
      children: [
        _TransactionAmount(
          object.amount,
          object.symbols,
          object.decimals,
        ),
        const SizedBox(width: 16),
        if (object.extrisincStatus != null)
          ExtrinsicStatusIcon(object.extrisincStatus!),
      ],
    );
  }
}

class _TransactionAmount extends StatelessWidget {
  const _TransactionAmount(
    this.amount,
    this.symbols,
    this.decimals,
  );

  final String amount;
  final String symbols;
  final int decimals;

  @override
  Widget build(final BuildContext context) {
    // final appService = BlocProvider.of<AppServiceLoaderCubit>(context).state;

    return D3pBodyLargeText(
      '$amount $symbols',
      translate: false,
    );
  }
}
