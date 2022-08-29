import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:threedpass/core/polkawallet/app_service.dart';
import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';

class ConnectionIndicator extends StatelessWidget {
  const ConnectionIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppServiceLoaderCubit, AppService>(
      builder: (context, state) {
        switch (state.status) {
          case AppServiceInitStatus.init:
          case AppServiceInitStatus.connecting:
            return PlatformCircularProgressIndicator();
          case AppServiceInitStatus.connected:
            return Container(
              height: 10,
              width: 10,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.green,
              ),
            );
          case AppServiceInitStatus.error:
            return Container(
              height: 10,
              width: 10,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.red,
              ),
            );
        }
      },
    );
  }
}
