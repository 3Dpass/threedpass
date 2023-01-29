part of '../transactions_history_page.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({
    required this.object,
    final this.colorFromSecondary = false,
    final this.colorToSecondary = false,
    final super.key,
  });

  final GGetTransfersData_getTransfers_objects object;
  final bool colorFromSecondary;
  final bool colorToSecondary;

  @override
  Widget build(final BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBoxH8(),
        _TransactionAmount(object.value!.toInt().toString()),
        const SizedBoxH8(),
        _ShortAddress(
          prefix: 'From:',
          address: object.fromMultiAddressAccountId,
          colorSecondary: colorFromSecondary,
        ),
        const SizedBoxH4(),
        _ShortAddress(
          prefix: 'To:',
          address: object.toMultiAddressAccountId,
          colorSecondary: colorToSecondary,
        ),
        const SizedBoxH8(),
        _BlockDatetime(object.blockDatetime!),
      ],
    );
  }
}

class _TransactionAmount extends StatelessWidget {
  const _TransactionAmount(this.amount);

  final String amount;
  @override
  Widget build(final BuildContext context) {
    final appService = BlocProvider.of<AppServiceLoaderCubit>(context).state;
    final moneyStr = BalanceUtils.balance(
      amount,
      appService.networkStateData.safeDecimals,
    );
    final symbol = appService.networkStateData.tokenSymbol?.first ?? '';
    return Text(
      '$moneyStr $symbol',
      style: Theme.of(context).textTheme.bodyText1,
    );
  }
}

class _ShortAddress extends StatelessWidget {
  const _ShortAddress({
    required this.prefix,
    required this.address,
    required this.colorSecondary,
  });

  final String? address;
  final String prefix;
  final bool colorSecondary;

  @override
  Widget build(final BuildContext context) {
    final addressStr = Fmt.shorterAddress(address, pad: 10);
    return Text(
      '$prefix $addressStr',
      style: colorSecondary
          ? Theme.of(context).customTextStyles.secondaryText
          : null,
    );
  }
}

class _BlockDatetime extends StatelessWidget {
  const _BlockDatetime(this.dateTime);
  final GDateTime dateTime;
  @override
  Widget build(final BuildContext context) {
    final dt = DateTime.parse(dateTime.value);
    final fmt = DateFormat('kk:mm – dd-MM-yyyy').format(dt);
    return Text(fmt);
  }
}
