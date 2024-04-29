import 'package:json_bigint/json_bigint.dart';

String encodeArgs(final List<Object> args) {
  final encodedArgs = encodeJson(args);
  // final rawArray = encodedArgs.substring(1, encodedArgs.length - 1);
  return encodedArgs;
}
