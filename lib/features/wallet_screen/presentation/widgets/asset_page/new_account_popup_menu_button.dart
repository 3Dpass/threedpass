import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/polkawallet/app_service.dart';
import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';
import 'package:threedpass/router/router.gr.dart';

class NewAccountPopupMenuButton extends StatelessWidget {
  const NewAccountPopupMenuButton({Key? key}) : super(key: key);

  void onSelected(int? value, BuildContext context) {
    final appService = BlocProvider.of<AppServiceLoaderCubit>(context).state;
    switch (value) {
      case 1:
        context.router.push(
          CreateAccountWrapperRoute(appService: appService),
        );
        break;
      case 2:
        context.router.push(
          ImportAccountWrapperRoute(appService: appService),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppServiceLoaderCubit, AppService>(
      builder: (context, state) => PopupMenuButton(
        icon: const Icon(Icons.add),
        onSelected: (int? value) => onSelected(value, context),
        itemBuilder: (context) => [
          _CreateAccountMenuItem(appService: state),
          _ImportAccountMenuItem(appService: state),
        ],
      ),
    );
  }
}

class _CreateAccountMenuItem extends PopupMenuItem<int> {
  _CreateAccountMenuItem({required AppService appService})
      : super(
          enabled: appService.status == AppServiceInitStatus.connected,
          value: 1,
          child: Text('create_account_button_label'.tr()),
        );
}

class _ImportAccountMenuItem extends PopupMenuItem<int> {
  _ImportAccountMenuItem({required AppService appService})
      : super(
          value: 2,
          enabled: appService.status == AppServiceInitStatus.connected,
          child: Text('import_account_button_label'.tr()),
        );
}
