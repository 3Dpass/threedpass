import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/polkawallet/app_service.dart';
import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';
import 'package:threedpass/core/widgets/buttons/elevated_button.dart';
import 'package:threedpass/router/route_paths.dart';

class CreateAccountButton extends StatelessWidget {
  const CreateAccountButton({
    final Key? key,
  }) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    return BlocBuilder<AppServiceLoaderCubit, AppService>(
      builder: (final context, final state) => D3pElevatedButton(
        iconData: Icons.add,
        text: 'create_account_button_label'.tr(),
        onPressed: state.status == AppServiceInitStatus.connected
            ? () {
                context.router.pushNamed(
                  RoutePaths.createAccountMain +
                      RoutePaths.createAccountRandomMnemonic,
                );
              }
            : null,
      ),
    );
  }
}
