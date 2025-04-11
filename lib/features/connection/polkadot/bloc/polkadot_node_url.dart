import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/utils/async_value.dart';
import 'package:threedpass/features/connection/polkadot/domain/entities/polkadot_node_url_state.dart';
import 'package:threedpass/features/connection/polkadot/domain/usecases/resolve_3dp_node_to_connect.dart';

class PolkadotNodeUrl extends Cubit<PolkadotNodeUrlState> {
  PolkadotNodeUrl({required this.resolve3DPNode}) : super(AsyncValue.loading());

  final Resolve3DPNodeToConnect resolve3DPNode;

  Future<String> initUrl() async {
    try {
      final url = await resolve3DPNode.call(null);
      emit(AsyncValue.data(url));
      return url;
    } catch (e, st) {
      emit(AsyncValue.error(e, st));
      rethrow;
    }
  }

  String get status {
    if (state.hasError) {
      return 'error';
    }
    if (state.hasValue) {
      return state.value!;
    }
    return '?';
  }
}
