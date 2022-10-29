import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/polkawallet/app_service.dart';
import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';
import 'package:threedpass/core/theme/d3p_special_colors.dart';

class ConnectionIndicator extends StatelessWidget {
  const ConnectionIndicator({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    return BlocBuilder<AppServiceLoaderCubit, AppService>(
      builder: (final context, final state) {
        final customColors = Theme.of(context).customColors;

        switch (state.status) {
          case AppServiceInitStatus.init:
          case AppServiceInitStatus.connecting:
            return _SmallCircle(
              color: customColors.uncertainIcon,
            );
          case AppServiceInitStatus.connected:
            return _SmallCircle(
              color: customColors.positiveIcon,
            );
          case AppServiceInitStatus.error:
            return _SmallCircle(
              color: customColors.errorIcon,
            );
        }
      },
    );
  }
}

class _SmallCircle extends StatelessWidget {
  const _SmallCircle({
    required this.color,
    final Key? key,
  }) : super(key: key);

  final Color color;

  @override
  Widget build(final BuildContext context) {
    return Container(
      height: 10,
      width: 10,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
    );
  }
}
