import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:threedpass/features/accounts/bloc/import_account_state.dart';
import 'package:threedpass/features/accounts/domain/account_advanced_options.dart';
import 'package:threedpass/router/route_names.dart';

class ImportAccountCubit extends Cubit<ImportAccountState> {
  ImportAccountCubit(this.outerContext) : super(ImportAccountState.initial());

  final BuildContext outerContext;

  void popToRoot() {
    outerContext.router.popUntilRouteWithName(RouteNames.homePage);
  }

  void changeOptions(AccountAdvancedOptions accountAdvancedOptions) {
    emit(state.copyWith(accountAdvancedOptions: accountAdvancedOptions));
  }

  void changeImportType(ImportType importType) {
    emit(state.copyWith(importType: importType));
  }
}
