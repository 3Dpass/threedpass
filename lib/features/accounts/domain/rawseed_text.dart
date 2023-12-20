class RawseedText {
  final String rawInput;

  const RawseedText(
    this.rawInput,
  );

  String get fixedSeed => '0x$rawInput';
}
