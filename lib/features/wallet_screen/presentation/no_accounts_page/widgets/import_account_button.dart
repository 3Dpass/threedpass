import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/polkawallet/app_service.dart';
import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';
import 'package:threedpass/core/widgets/buttons/card_elevated_button.dart';
import 'package:threedpass/features/accounts/presentation/pages/create_account/create_account_wrapper.dart';

class ImportAccountButton extends StatelessWidget {
  const ImportAccountButton({
    final Key? key,
  }) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    return BlocBuilder<AppServiceLoaderCubit, AppService>(
      builder: (final context, final state) => D3pCardElevatedButton(
        iconData: Icons.import_export_outlined,
        text: 'import_account_button_label'.tr(),
        onPressed: state.status == AppServiceInitStatus.connected
            ? () => CreateAccountWrapper.pushToImportType(context)
            : null,
      ),
    );
  }
}
