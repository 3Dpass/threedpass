// ignore_for_file: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member

part of './app_service_cubit.dart';

extension _ on AppServiceLoaderCubit {
  Future<void> _init(final WalletSettings walletSettings) async {
    final keyring = state.keyring;
    // Init keyring
    await keyring.init([ss58formatLive, ss58formatTest]);

    final appService = AppService(
      plugin: _buildPlugin(walletSettings),
      keyring: keyring,
      status: AppServiceInitStatus.connecting,
    );

    await appService.plugin.beforeStart(
      keyring,
      webView: appService.plugin.sdk.webView,
    );

    emit(appService);
    unawaited(_startPlugin(appService));
  }

  static D3pCorePlugin _buildPlugin(final WalletSettings walletSettings) {
    return walletSettings.isTestNet
        ? D3pTestNetPlugin(nodeUrl: walletSettings.nodeUrl)
        : D3pLiveNetPlugin(nodeUrl: walletSettings.nodeUrl);
  }

  /// Connects to node, subscribes to balance and blocks updates.
  /// Emits new state of [AppService]
  Future<void> _startPlugin(
    final AppService service, {
    final NetworkParams? node,
  }) async {
    // ignore: unused_local_variable
    final connected = await service.plugin.sdk.api.connectNode(
      service.keyring,
      node != null ? [node] : service.plugin.nodeList,
    );

    final newAppService = await _buildNewAppServiceWithProperties(service);

    // In case we need to subscribe to blocks
    // unawaited(
    //   newAppService.plugin.sdk.api.setting
    //       .subscribeBestNumber((final String value) {
    //     newAppService.bestNumber.value = value;
    //   }),
    // );

    unawaited(newAppService.subscribeToBalance());
    await newAppService.setTokensData();

    AppServiceLoaderCubit.registerTransferCubits(newAppService);

    emit(newAppService);
  }

  /// Gets network properties from node and creates new [AppService] instance
  /// with those properties and connection state.
  /// It sets error message if could not get network properties.
  Future<AppService> _buildNewAppServiceWithProperties(
    final AppService oldAppService,
  ) async {
    final networkData =
        await oldAppService.plugin.sdk.api.setting.queryNetworkProps();

    // ignore: unused_local_variable
    final consts = await oldAppService.plugin.sdk.api.setting
        .queryNetworkConst(); // TODO Save this data to AppService

    late final AppService newAppService;

    // One time the condition was [if (connected != null && networkData != null)]
    // but something happened when I forked the polkawallet_sdk repo
    // https://github.com/L3odr0id/polkawallet_sdk
    // And now [sdk.api.connectNode(...)] always returns null
    // So I changed it to [if (networkData != null)]
    // If you update the sdk, you may want to change it back
    // TODO?
    if (networkData != null) {
      // If you connected to test node and local settings are live or
      // you connected to live node and local settings are test,
      // then you need to change settings
      final currentWalletSettings = settingsConfigCubit.state.walletSettings;
      final isNodeTestNet = networkData.ss58Format == ss58formatTest;
      if (currentWalletSettings.isTestNet != isNodeTestNet) {
        settingsConfigCubit.updateSettings(
          settingsConfigCubit.state.copyWith(
            walletSettings: currentWalletSettings.copyWith(
              isTestNet: isNodeTestNet,
            ),
          ),
        );
      }

      newAppService = AppService(
        plugin: state.plugin,
        keyring: state.keyring,
        status: AppServiceInitStatus.connected,
        networkStateData: networkData,
      );
    } else {
      newAppService = AppService(
        plugin: state.plugin,
        keyring: state.keyring,
        networkStateData: networkData,
        status: AppServiceInitStatus.error,
      );
    }

    return newAppService;
  }
}
