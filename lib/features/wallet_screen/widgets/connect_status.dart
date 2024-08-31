import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/polkawallet/app_service.dart';
import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';
import 'package:threedpass/core/theme/d3p_special_colors.dart';
import 'package:threedpass/core/widgets/progress_indicator/progress_indicator.dart';
import 'package:threedpass/core/widgets/text/d3p_body_medium_text.dart';

class ConnectStatus extends StatelessWidget {
  const ConnectStatus({final Key? key}) : super(key: key);

  String text(final AppServiceInitStatus status) {
    switch (status) {
      case AppServiceInitStatus.init:
        return 'init_status_sdk';

      case AppServiceInitStatus.connecting:
        return 'init_status_connecting_to_node';

      case AppServiceInitStatus.connected:
        return 'init_status_completed';

      case AppServiceInitStatus.error:
        return 'init_status_connecting_to_node_failed';
    }
  }

  @override
  Widget build(final BuildContext context) {
    return BlocBuilder<AppServiceLoaderCubit, AppService>(
      builder: (final context, final state) => Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _Indicator(state.status),
          const SizedBox(width: 8),
          D3pBodyMediumText(
            text(state.status),
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
  Widget build(final BuildContext context) {
    switch (status) {
      case AppServiceInitStatus.init:
      case AppServiceInitStatus.connecting:
        return const D3pProgressIndicator(size: 30);

      case AppServiceInitStatus.connected:
        return Icon(
          Icons.check_box,
          color: Theme.of(context).colorScheme.primary,
        );

      case AppServiceInitStatus.error:
        return Icon(
          Icons.error_outline,
          color: Theme.of(context).colorScheme.error,
        );
    }
  }
}
