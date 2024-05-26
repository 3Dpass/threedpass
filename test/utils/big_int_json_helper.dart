import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:threedpass/core/utils/big_int_json_helper.dart';

void main() {
  group('BigIntJsonHelper tests', () {
    test('Replace one', () {
      const rawBigInt = '100000000000000000000';
      final bigIntToTest = BigInt.parse(rawBigInt);
      final input = [
        55,
        "0x5276f5c5c8ce0ab3af5141b13a27ffaaaaaaaaaaaaaa",
        1,
        {
          "obj_idx": 11,
          "prop_idx": 0,
          "max_supply": BigIntJsonHelper.encode(bigIntToTest),
        },
      ];

      final basicEncoding = const JsonEncoder().convert(input);

      final output = BigIntJsonHelper.replace(basicEncoding);
      // print(output);

      const expected =
          '[55,"0x5276f5c5c8ce0ab3af5141b13a27ffaaaaaaaaaaaaaa",1,{"obj_idx":11,"prop_idx":0,"max_supply":$rawBigInt}]';

      expect(output, expected);
    });
  });
}
