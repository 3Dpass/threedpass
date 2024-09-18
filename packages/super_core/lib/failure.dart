class WrongTypeFailure implements Exception {
  const WrongTypeFailure(
    this.varName,
    this.expectedType,
    this.actualType,
  ) : super();

  final String varName;
  final String expectedType;
  final String actualType;

  @override
  String toString() =>
      'WrongTypeFailure(varName: $varName, expectedType: $expectedType, actualType: $actualType)';
}
