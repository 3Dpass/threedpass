part of 'account_store_bloc.dart';

abstract class AccountStoreEvent {
  const AccountStoreEvent();
}

class SetCredentials extends AccountStoreEvent {
  const SetCredentials({
    required this.name,
    required this.password,
  });

  final String name;
  final String password;
}

class GenerateMnemonicKey extends AccountStoreEvent {
  const GenerateMnemonicKey([this.key = '']);

  final String key;
}

class SetMnemonic extends AccountStoreEvent {
  const SetMnemonic(this.mnemonic);

  final String mnemonic;
}

class SetRawseed extends AccountStoreEvent {
  const SetRawseed(this.rawseed);

  final RawseedText rawseed;
}

class ResetAccount extends AccountStoreEvent {
  const ResetAccount();
}

class SetWCPairing extends AccountStoreEvent {
  const SetWCPairing(this.pairing);

  final bool pairing;
}

class SetAccountRecoveryInfo extends AccountStoreEvent {
  const SetAccountRecoveryInfo(this.info);

  final RecoveryInfo info;
}

class PopToRoout extends AccountStoreEvent {
  const PopToRoout();
}

class ChangeAdvancedOptions extends AccountStoreEvent {
  const ChangeAdvancedOptions(this.options);

  final AccountAdvancedOptions options;
}
