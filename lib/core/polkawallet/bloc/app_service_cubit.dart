import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:polkawallet_sdk/plugin/index.dart';
import 'package:polkawallet_sdk/storage/keyring.dart';
import 'package:threedpass/core/polkawallet/app_service.dart';
import 'package:threedpass/core/polkawallet/constants.dart';

class AppServiceLoaderCubit extends Cubit<Object> {
  AppServiceLoaderCubit({
    required PolkawalletPlugin polkawalletPlugin,
    required Keyring keyring,
  }) : super('init_status_sdk') {
    _init(polkawalletPlugin: polkawalletPlugin, keyring: keyring);
  }

  Future<void> _init({
    required PolkawalletPlugin polkawalletPlugin,
    required Keyring keyring,
  }) async {
    await keyring.init([ss58formatLive]);
    // final w = WalletSDK();
    // await w.init(keyring);
    await polkawalletPlugin.sdk.init(keyring);

    emit('init_status_connecting_to_node');

    // final res = await w.api.connectNode(keyring, d3pLiveNodesList);

    final res =
        await polkawalletPlugin.sdk.api.connectNode(keyring, d3pLiveNodesList);

    if (res != null) {
      emit(AppService(polkawalletPlugin, keyring));
    } else {
      emit('init_status_connecting_to_node_failed');
    }
  }
}
