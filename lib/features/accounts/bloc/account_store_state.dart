part of 'account_store_bloc.dart';

@CopyWith()
class AccountCreate {
  final String name;
  final String password;
  final String mnemonicKey;

  const AccountCreate({
    required this.mnemonicKey,
    required this.name,
    required this.password,
  });

  const AccountCreate.intial()
      : name = '',
        password = '',
        mnemonicKey = '';
}

@CopyWith()
class AccountStoreState {
  const AccountStoreState({
    required this.accountCreated,
    required this.addressIconsMap,
    required this.newAccount,
    required this.pubKeyAddressMap,
    required this.recoveryInfo,
    required this.walletConnectPairing,
    required this.wcSessions,
  });

  final AccountCreate newAccount;
  final bool accountCreated;

  final Map<int, Map<String, String>> pubKeyAddressMap;
  final Map<String, String> addressIconsMap;

  final RecoveryInfo recoveryInfo;

  final bool walletConnectPairing;

  final List<WCPairedData> wcSessions;
}

class _AccountStoreStateInitial extends AccountStoreState {
  _AccountStoreStateInitial()
      : super(
          newAccount: const AccountCreate.intial(),
          recoveryInfo: RecoveryInfo(),
          walletConnectPairing: false,
          addressIconsMap: <String, String>{},
          pubKeyAddressMap: <int, Map<String, String>>{},
          accountCreated: false,
          wcSessions: <WCPairedData>[],
        );
}
