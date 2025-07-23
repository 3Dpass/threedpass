import 'package:threedpass/core/chains/domain/entities/address.dart';
import 'package:threedpass/core/usecase.dart';

class ResolveNameByAddress extends UseCase<String?, Address> {
  @override
  Future<String?> call(Address params) async {
    // TODO: get names from on-chain-identity
    // TODO: get names from accounts
    // TODO: get names from contacts
    return null;
  }
}
