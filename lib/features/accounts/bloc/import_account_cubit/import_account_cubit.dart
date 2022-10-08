import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:threedpass/features/accounts/bloc/import_account_cubit/import_account_state.dart';
import 'package:threedpass/features/accounts/domain/account_advanced_options.dart';
import 'package:threedpass/features/accounts/domain/account_create.dart';
import 'package:threedpass/router/route_names.dart';

// TODO Убрать этот костыль
class ImportAccountCubitA extends Cubit<ImportAccountState> {
  ImportAccountCubitA(this.outerContext) : super(ImportAccountState.initial());

  final BuildContext outerContext;
  final TextEditingController textEditingController = TextEditingController();

  void popToRoot() {
    outerContext.router.popUntilRouteWithName(RouteNames.homePage);
  }

  void changeOptions(AccountAdvancedOptions accountAdvancedOptions) {
    textEditingController.clear();
    emit(state.copyWith(accountAdvancedOptions: accountAdvancedOptions));
  }

  void changeImportType(ImportType importType) {
    emit(state.copyWith(importType: importType));
  }

  void setMnemonic(String mnemonic) {
    emit(
      state.copyWith(
        accountCreate: state.accountCreate.copyWithTyped(mnemonicKey: mnemonic),
      ),
    );
  }
}
