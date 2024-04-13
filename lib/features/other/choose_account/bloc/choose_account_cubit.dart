import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:polkawallet_sdk/storage/types/keyPairData.dart';
import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';

class ChooseAccountCubit extends Cubit<KeyPairData?> {
  ChooseAccountCubit({
    required final AppServiceLoaderCubit appServiceLoaderCubit,
    required this.onAccountSelected,
    required this.passwordController,
  })  : accounts = appServiceLoaderCubit.state.keyring.allAccounts,
        super(appServiceLoaderCubit.state.keyring.current);

  final List<KeyPairData> accounts;
  final void Function(KeyPairData acc)? onAccountSelected;
  final TextEditingController passwordController;

  void setAcc(final KeyPairData acc) {
    emit(acc);
    onAccountSelected!(acc);
  }
}
