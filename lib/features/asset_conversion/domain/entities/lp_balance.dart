class LPBalance {
  final String rawBalance;
  // final String status;
  // reason {balance: 10,002,009,901, status: Liquid, reason: Consumer, extra: null}
  // reason {balance: 100, status: Liquid, reason: {DepositFrom: [d1CMCgypZvZJFRRXqo8LKj1FgqrHzKT6TzjYMKzgUUS9VZRQr, 1,000,000,000,000]}, extra: null}

  const LPBalance({
    required this.rawBalance,
  });

  LPBalance.fromJson(final Map<String, dynamic> json)
      : rawBalance = json['balance'].toString();
}
