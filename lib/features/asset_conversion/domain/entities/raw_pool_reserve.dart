class RawPoolReserve {
  final String balance1;
  final String balance2;

  const RawPoolReserve({
    required this.balance1,
    required this.balance2,
  });

  RawPoolReserve.fromJson(final List<dynamic> json)
      : balance1 = json[0].toString(),
        balance2 = json[1].toString();

  BigInt get balance1BigInt => BigInt.parse(balance1.replaceAll(',', ''));
  BigInt get balance2BigInt => BigInt.parse(balance2.replaceAll(',', ''));
}
