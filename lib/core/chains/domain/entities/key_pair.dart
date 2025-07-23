import 'package:threedpass/core/chains/domain/entities/address.dart';

class KeyPair {
  final String? name;
  final Address address;
  final String? pubKey;

  const KeyPair({
    required this.name,
    required this.address,
    required this.pubKey,
  });
}
