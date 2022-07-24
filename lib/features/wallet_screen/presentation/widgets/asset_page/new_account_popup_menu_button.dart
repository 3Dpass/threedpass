import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/polkawallet/app_service.dart';
import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';
import 'package:threedpass/features/accounts/router/create_account_page_route.dart';
import 'package:threedpass/router/router.gr.dart';

class NewAccountPopupMenuButton extends StatelessWidget {
  const NewAccountPopupMenuButton({Key? key}) : super(key: key);

  void onSelected(int? value, BuildContext context) {
    switch (value) {
      case 1:
        context.router.push(
          CreateAccountWrapperRoute(
            appService: BlocProvider.of<AppServiceLoaderCubit>(context).state
                as AppService,
          ),
        );
        break;
      case 2:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      icon: const Icon(Icons.add),
      onSelected: (int? value) => onSelected(value, context),
      itemBuilder: (context) => [
        PopupMenuItem(
          value: 1,
          child: Text('create_account_button_label'.tr()),
        ),
        PopupMenuItem(
          value: 2,
          enabled: false,
          child: Text('import_account_button_label'.tr()),
        ),
      ],
    );
  }
}
