import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:threedpass/core/polkawallet/app_service.dart';
import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';

class ConnectStatus extends StatelessWidget {
  const ConnectStatus({Key? key}) : super(key: key);

  String text(AppServiceInitStatus status, BuildContext context) {
    switch (status) {
      case AppServiceInitStatus.init:
        return 'init_status_sdk'.tr();

      case AppServiceInitStatus.connecting:
        return 'init_status_connecting_to_node'.tr();

      case AppServiceInitStatus.connected:
        return 'init_status_completed'.tr();

      case AppServiceInitStatus.error:
        return 'init_status_connecting_to_node_failed'.tr();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppServiceLoaderCubit, AppService>(
      builder: (context, state) => Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _Indicator(state.status),
          const SizedBox(width: 8),
          Text(
            text(state.status, context),
          ),
        ],
      ),
    );
  }
}

class _Indicator extends StatelessWidget {
  const _Indicator(this.status);

  final AppServiceInitStatus status;

  @override
  Widget build(BuildContext context) {
    switch (status) {
      case AppServiceInitStatus.init:
      case AppServiceInitStatus.connecting:
        return SizedBox(
          width: 30,
          height: 30,
          child: PlatformCircularProgressIndicator(),
        );

      case AppServiceInitStatus.connected:
        return const Icon(Icons.check_box, color: Colors.green);

      case AppServiceInitStatus.error:
        return const Icon(Icons.error_outline, color: Colors.red);
    }
  }
}
