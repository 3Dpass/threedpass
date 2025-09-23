import 'package:threedpass/features/chains/domain/entities/address.dart';
import 'package:threedpass/features/chains/domain/entities/resolved_account_name.dart';
import 'package:threedpass/core/usecase.dart';

class ResolveNameByAddress extends UseCase<ResolvedAccountName?, Address> {
  @override
  Future<ResolvedAccountName?> call(Address params) async {
    // TODO: get names from on-chain-identity
    // TODO: get names from accounts
    // TODO: get names from contacts
    // TODO: impl cache for resolved names. remove items from cache when change accounts or contacts
    return null;
  }
}
