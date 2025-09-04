import 'package:equatable/equatable.dart';
import 'package:threedpass/features/chains/domain/entities/address.dart';

class KeyPair extends Equatable {
  final String? name;
  final Address address;
  final String pubKey;

  const KeyPair({
    required this.name,
    required this.address,
    required this.pubKey,
  });

  @override
  List<Object?> get props => [name, address, pubKey];
}
