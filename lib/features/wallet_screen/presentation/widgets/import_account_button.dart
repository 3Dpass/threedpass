import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:threedpass/common/button_styles.dart';
import 'package:threedpass/core/polkawallet/app_service.dart';
import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';
import 'package:threedpass/router/router.gr.dart';

class ImportAccountButton extends StatelessWidget {
  const ImportAccountButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppServiceLoaderCubit, AppService>(
      builder: (context, state) => ElevatedButton.icon(
        style: AppButtonStyles.primaryButton,
        icon: const Icon(Icons.import_export_outlined),
        label: Text('import_account_button_label'.tr()),
        onPressed: state.status == AppServiceInitStatus.connected
            ? () => context.router.push(
                  ImportAccountWrapperRoute(appService: state),
                )
            : null,
      ),
    );
  }
}
