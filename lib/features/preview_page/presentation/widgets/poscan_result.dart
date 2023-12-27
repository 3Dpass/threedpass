import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/polkawallet/app_service.dart';
import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';
import 'package:threedpass/core/widgets/buttons/elevated_button.dart';
import 'package:threedpass/core/widgets/other/padding_16.dart';
import 'package:threedpass/router/router.gr.dart';

class PoscanResult extends StatelessWidget {
  const PoscanResult({super.key});

  @override
  Widget build(final BuildContext context) {
    return BlocBuilder<AppServiceLoaderCubit, AppService>(
      builder: (final context, final state) => Padding16(
        child: D3pElevatedButton(
          text: '3d_rpc_button_label'.tr(),
          onPressed: state.status == AppServiceInitStatus.connected
              ? () => context.router.push(const D3PRPCRouteWrapper())
              : null,
        ),
      ),
    );
  }
}
