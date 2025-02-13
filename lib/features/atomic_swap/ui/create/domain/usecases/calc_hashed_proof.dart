import 'package:hashlib/hashlib.dart';
import 'package:threedpass/core/usecase.dart';

class CalcHashedProof extends UseCase<String, String> {
  @override
  Future<String> call(String param) async =>
      "0x" + blake2b256.string(param).hex();
}
