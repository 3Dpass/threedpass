import 'package:threedpass/core/chains/domain/entities/resolved_account_name.dart';

class DisplayAccount {
  final String address;
  final ResolvedAccountName? name;

  const DisplayAccount({
    required this.address,
    required this.name,
  });
}
