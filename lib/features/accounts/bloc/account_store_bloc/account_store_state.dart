part of 'account_store_bloc.dart';

@CopyWith()
class AccountStoreState {
  const AccountStoreState({
    required this.addressIconsMap,
    required this.newAccount,
    required this.pubKeyAddressMap,
    required this.recoveryInfo,
    required this.walletConnectPairing,
    required this.wcSessions,
    required this.accountAdvancedOptions,
  });

  final AccountCreate newAccount;

  final Map<int, Map<String, String>> pubKeyAddressMap;
  final Map<String, String> addressIconsMap;

  final RecoveryInfo recoveryInfo;

  final bool walletConnectPairing;

  final List<WCPairedData> wcSessions;

  final AccountAdvancedOptions accountAdvancedOptions;
}

class _AccountStoreStateInitial extends AccountStoreState {
  _AccountStoreStateInitial()
      : super(
          newAccount: const AccountCreate.intial(),
          recoveryInfo: RecoveryInfo(),
          walletConnectPairing: false,
          addressIconsMap: <String, String>{},
          pubKeyAddressMap: <int, Map<String, String>>{},
          wcSessions: <WCPairedData>[],
          accountAdvancedOptions: const AccountAdvancedOptions.defaultValues(),
        );
}
