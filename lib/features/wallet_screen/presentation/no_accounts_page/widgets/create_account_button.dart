import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/common/button_styles.dart';
import 'package:threedpass/core/polkawallet/app_service.dart';
import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';
import 'package:threedpass/features/accounts/presentation/pages/create_account/create_account_wrapper.dart';

class CreateAccountButton extends StatelessWidget {
  const CreateAccountButton({
    final Key? key,
  }) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    return BlocBuilder<AppServiceLoaderCubit, AppService>(
      builder: (final context, final state) => ElevatedButton.icon(
        style: AppButtonStyles.primaryButton,
        icon: const Icon(Icons.add),
        label: Text('create_account_button_label'.tr()),
        onPressed: state.status == AppServiceInitStatus.connected
            ? () => CreateAccountWrapper.pushToGenerateRandom(context)
            : null,
      ),
    );
  }
}
