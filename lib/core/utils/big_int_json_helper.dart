/// This is very bad code. But there is no workaround for smooth bigint serialization
final class BigIntJsonHelper {
  static const String tag = 'BigIntJsonHelper';

  static String encode(final BigInt bigInt) {
    return '$tag$bigInt';
  }

  static String replace(final String jsonEncoded) {
    final pattern = RegExp('\"$tag([0-9]+)\"');
    return jsonEncoded.replaceAllMapped(
      pattern,
      (final match) {
        return match.group(1)!;
      },
    );
  }
}
