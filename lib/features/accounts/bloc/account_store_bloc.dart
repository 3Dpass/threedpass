import 'package:auto_route/auto_route.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:polkawallet_sdk/api/types/recoveryInfo.dart';
import 'package:polkawallet_sdk/api/types/walletConnect/pairingData.dart';
import 'package:threedpass/router/route_names.dart';

part 'account_store_event.dart';
part 'account_store_state.dart';
part 'account_store_bloc.g.dart';

class AccountStoreBloc extends Bloc<AccountStoreEvent, AccountStoreState> {
  AccountStoreBloc(this.outerContext) : super(_AccountStoreStateInitial()) {
    on<SetCredentials>(_setCredentials);
    on<SetAccountMnemonicKey>(_setAccountMnemonicKey);
    on<ResetAccount>(_resetAccount);
    on<SetPubKeyAddress>(_setPubKeyAddress);
    on<SetAddressIcon>(_setAddressIcon);
    on<PopToRoout>(_popToRoout);
  }

  final BuildContext outerContext;

  Future<void> _popToRoout(
    PopToRoout event,
    Emitter<AccountStoreState> emit,
  ) async {
    outerContext.router.popUntilRouteWithName(RouteNames.homePage);
  }

  Future<void> _setCredentials(
    SetCredentials event,
    Emitter<AccountStoreState> emit,
  ) async {
    final newState = state.copyWith(
      newAccount: state.newAccount.copyWith(
        name: event.name,
        password: event.password,
      ),
    );
    emit(newState);
  }

  Future<void> _setAccountMnemonicKey(
    SetAccountMnemonicKey event,
    Emitter<AccountStoreState> emit,
  ) async {
    final newState = state.copyWith(
      newAccount: state.newAccount.copyWith(
        mnemonicKey: event.key,
      ),
    );
    emit(newState);
  }

  Future<void> _resetAccount(
    ResetAccount event,
    Emitter<AccountStoreState> emit,
  ) async {
    final newState = state.copyWith(
      newAccount: const AccountCreate.intial(),
    );
    emit(newState);
  }

  Future<void> _setPubKeyAddress(
    SetPubKeyAddress event,
    Emitter<AccountStoreState> emit,
  ) async {
    // TODO I'm not 100% sure what happens here
    // Just copied https://github.com/polkawallet-io/app/blob/48821c58b19b2e6df17200bc0c5d10bf5577ac41/lib/store/account.dart#L59
    final mutableMap =
        Map<int, Map<String, String>>.from(state.pubKeyAddressMap);

    for (var ss58 in event.data.keys) {
      // get old data map
      Map<String, String> addresses =
          Map.of(state.pubKeyAddressMap[int.parse(ss58)] ?? {});
      // set new data
      Map.of(event.data[ss58]!).forEach((k, v) {
        addresses[k] = v;
      });
      // update state
      mutableMap[int.parse(ss58)] = addresses;
    }

    emit(state.copyWith(pubKeyAddressMap: mutableMap));
  }

  Future<void> _setAddressIcon(
    SetAddressIcon event,
    Emitter<AccountStoreState> emit,
  ) async {
    // TODO I'm not 100% sure what happens here
    // Just copied https://github.com/polkawallet-io/app/blob/48821c58b19b2e6df17200bc0c5d10bf5577ac41/lib/store/account.dart#L74
    final mutableMap = Map<String, String>.from(state.addressIconsMap);
    for (var i in event.list) {
      mutableMap[i[0]] = i[1];
    }

    emit(state.copyWith(addressIconsMap: mutableMap));
  }
}
