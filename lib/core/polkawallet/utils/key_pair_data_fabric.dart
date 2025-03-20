import 'package:polkawallet_sdk/storage/types/keyPairData.dart';

class KeyPairDataFabric {
  KeyPairDataFabric._();

  static KeyPairData fromJson({
    required final String address,
    required final String? name,
  }) =>
      KeyPairData.fromJson({
        'address': address,
        'name': name,
      });
}
