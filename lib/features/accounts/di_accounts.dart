import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';
import 'package:threedpass/core/utils/di_module.dart';
import 'package:threedpass/features/accounts/bloc/account_store_bloc/account_store_bloc.dart';

class DIAccounts extends DIModule {
  @override
  Future<void> setup(final GetIt getIt) async {
    getIt.registerFactoryParam<AccountStoreBloc, BuildContext, void>(
      (final context, final _) => AccountStoreBloc(
        appServiceLoaderCubit: getIt<AppServiceLoaderCubit>(),
        outerContext: context,
      ),
    );
  }
}
