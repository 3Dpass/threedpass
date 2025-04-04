import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/widgets/progress_indicator/progress_indicator.dart';
import 'package:threedpass/features/connection/polkadot/bloc/polkadot_node_url.dart';
import 'package:threedpass/features/connection/polkadot/domain/entities/polkadot_node_url_state.dart';

class NodeUrlStatus extends StatelessWidget {
  final TextStyle? valueTextTheme;

  NodeUrlStatus({this.valueTextTheme});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PolkadotNodeUrl, PolkadotNodeUrlState>(
      builder: (BuildContext context, PolkadotNodeUrlState state) {
        if (state.hasValue) {
          return Text(
            state.value!,
            style: valueTextTheme,
          );
        }
        if (state.isLoading) {
          return D3pProgressIndicator(
            size: null,
            strokeWidth: 2,
          );
        }
        if (state.hasError) {
          return Text(state.error.toString());
        }
        return Text('Error: Unknown state'); // TODO Localize
      },
    );
  }
}
