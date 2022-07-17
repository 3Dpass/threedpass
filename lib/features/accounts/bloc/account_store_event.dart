part of 'account_store_bloc.dart';

abstract class AccountStoreEvent {
  const AccountStoreEvent();
}

class SetNewAccount extends AccountStoreEvent {
  const SetNewAccount({
    required this.name,
    required this.password,
  });

  final String name;
  final String password;
}

class SetAccountKey extends AccountStoreEvent {
  const SetAccountKey(this.key);

  final String key;
}

class ResetAccount extends AccountStoreEvent {
  const ResetAccount();
}

class SetPubKeyAddress extends AccountStoreEvent {
  const SetPubKeyAddress(this.data);

  final Map<String, Map> data;
}

class SetAddressIcon extends AccountStoreEvent {
  const SetAddressIcon(this.list);

  final List list;
}

class SetWCPairing extends AccountStoreEvent {
  const SetWCPairing(this.pairing);

  final bool pairing;
}

class SetAccountRecoveryInfo extends AccountStoreEvent {
  const SetAccountRecoveryInfo(this.info);

  final RecoveryInfo info;
}

class SetWCSessions extends AccountStoreEvent {
  const SetWCSessions(this.session);

  final List<WCPairedData> session;
}

class CreateWCSession extends AccountStoreEvent {
  const CreateWCSession(this.session);

  final WCPairedData session;
}

class DeleteWCSession extends AccountStoreEvent {
  const DeleteWCSession(this.session);

  final WCPairedData session;
}
