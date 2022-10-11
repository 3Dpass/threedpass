import 'dart:math';

class RandomHex {
  static const _chars = '1234567890abcdef';
  static final Random _rnd = Random();

  static String generate(final int length) => String.fromCharCodes(
        Iterable.generate(
          length,
          (final _) => _chars.codeUnitAt(
            _rnd.nextInt(_chars.length),
          ),
        ),
      );
}
