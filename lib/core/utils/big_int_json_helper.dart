/// This is very bad code. But there is no workaround for smooth bigint serialization
final class BigIntJsonHelper {
  static const String tag = 'BigIntJsonHelper';
  static final patternCommas = RegExp('"$tag([0-9]+)"');
  static final patternNoCommas = RegExp('$tag([0-9]+)');

  static String encode(final BigInt bigInt) {
    return '$tag$bigInt';
  }

  static String replace(final String jsonEncoded) {
    return jsonEncoded.replaceAllMapped(
      patternCommas,
      (final match) {
        return match.group(1)!;
      },
    ).replaceAllMapped(
      patternNoCommas,
      (final match) {
        return match.group(1)!;
      },
    );
  }
}
