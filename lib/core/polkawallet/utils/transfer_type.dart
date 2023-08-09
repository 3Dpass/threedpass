class TransferTypeValue {
  static const TransferType defaultType = TransferType.transferKeepAlive;

  const TransferTypeValue(this.type);

  final TransferType type;

  @override
  String toString() {
    return type.name;
  }
}

enum TransferType {
  transfer,
  transferKeepAlive,
}
