import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:calc/calc.dart';

void main() {
  const MethodChannel channel = MethodChannel('calc');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await Calc.platformVersion, '42');
  });
}
