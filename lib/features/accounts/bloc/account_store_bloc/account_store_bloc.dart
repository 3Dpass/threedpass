import 'package:auto_route/auto_route.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:polkawallet_sdk/api/types/recoveryInfo.dart';
import 'package:threedpass/core/polkawallet/app_service.dart';
import 'package:threedpass/features/accounts/domain/account_advanced_options.dart';
import 'package:threedpass/features/accounts/domain/account_info.dart';
import 'package:threedpass/features/accounts/domain/rawseed_text.dart';
import 'package:threedpass/router/router.gr.dart';

part 'account_store_event.dart';
part 'account_store_state.dart';
part 'account_store_bloc.g.dart';

class AccountStoreBloc extends Bloc<AccountStoreEvent, AccountStoreState> {
  AccountStoreBloc(this.outerContext) : super(_AccountStoreStateInitial()) {
    on<SetCredentials>(_setCredentials);
    on<GenerateMnemonicKey>(_generateMnemonicKey);
    on<PopToRoout>(_popToRoout);
    on<ChangeAdvancedOptions>(_changeAdvancedOptions);
    on<SetMnemonic>(_setMnemonic);
    on<SetRawseed>(_setRawseed);
  }

  final BuildContext outerContext;

  Future<void> _popToRoout(
    final PopToRoout event,
    final Emitter<AccountStoreState> emit,
  ) async {
    outerContext.router.popUntilRouteWithName(InitialWrapperRoute.name);
  }

  Future<void> _setCredentials(
    final SetCredentials event,
    final Emitter<AccountStoreState> emit,
  ) async {
    final newState = state.copyWith(
      newAccount: state.newAccount.copyWithTyped(
        name: event.name,
        password: event.password,
      ),
    );
    emit(newState);
  }

  Future<void> _changeAdvancedOptions(
    final ChangeAdvancedOptions event,
    final Emitter<AccountStoreState> emit,
  ) async {
    emit(state.copyWith(accountAdvancedOptions: event.options));
  }

  Future<void> _setMnemonic(
    final SetMnemonic event,
    final Emitter<AccountStoreState> emit,
  ) async {
    emit(
      state.copyWith(
        newAccount: state.newAccount.copyWithTyped(
          mnemonicKey: event.mnemonic,
        ),
      ),
    );
  }

  Future<void> _setRawseed(
    final SetRawseed event,
    final Emitter<AccountStoreState> emit,
  ) async {
    emit(
      state.copyWith(
        newAccount: AccountCreateSeed(
          seed: event.rawseed.fixedSeed,
          name: '',
          password: '',
        ),
      ),
    );
  }

  Future<void> _generateMnemonicKey(
    final GenerateMnemonicKey event,
    final Emitter<AccountStoreState> emit,
  ) async {
    final data = await event.service.plugin.sdk.api.keyring.generateMnemonic(
      event.service.plugin.basic.ss58!,
      key: event.key,
      derivePath: state.accountAdvancedOptions.path,
      cryptoType: state.accountAdvancedOptions.type,
    );

    if (data.mnemonic != null) {
      final newState = state.copyWith(
        newAccount: state.newAccount.copyWithTyped(
          mnemonicKey: data.mnemonic,
        ),
      );
      emit(newState);
    } else {
      addError('Mnemonic was not generated');
    }
  }
}
