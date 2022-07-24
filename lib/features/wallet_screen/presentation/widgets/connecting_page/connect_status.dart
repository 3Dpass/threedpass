import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';

class ConnectStatus extends StatelessWidget {
  const ConnectStatus({Key? key}) : super(key: key);

  String text(Object state, BuildContext context) {
    if (state.runtimeType == String) {
      return (state as String).tr();
    } else {
      return 'init_status_completed'.tr();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppServiceLoaderCubit, Object>(
      builder: (context, state) => Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _Indicator(state),
          const SizedBox(width: 8),
          Text(
            text(state, context),
          ),
        ],
      ),
    );
  }
}

class _Indicator extends StatelessWidget {
  const _Indicator(this.state);

  final Object state;

  @override
  Widget build(BuildContext context) {
    if (state.runtimeType == String) {
      if (state == 'init_status_connecting_to_node_failed') {
        return const Icon(Icons.error_outline, color: Colors.red);
      } else {
        return const SizedBox(
          width: 30,
          height: 30,
          child: CircularProgressIndicator(),
        );
      }
    } else {
      return const Icon(Icons.check_box, color: Colors.green);
    }
  }
}
