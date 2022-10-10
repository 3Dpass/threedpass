part of './snapshot_create_from_file.dart';

class _TransBytes {
  final ScanSettings scanSettings;
  final AppServiceLoaderCubit appServiceLoaderCubit;

  _TransBytes({
    required this.scanSettings,
    required this.appServiceLoaderCubit,
  });

  Future<String> transBytes() async {
    final String userTransBytes = scanSettings.transBytes;

    if (userTransBytes.isNotEmpty) {
      return userTransBytes;
    }

    final AppService appService = appServiceLoaderCubit.state;
    final String bestnumber = appService.bestNumber.value;

    if (bestnumber.isNotEmpty) {
      final blockHash = await appService.plugin.sdk.api.service.webView!
          .evalJavascript('api.rpc.chain.getBlockHash($bestnumber)');

      // final signedBlock = await appService.plugin.sdk.api.service.webView!
      //     .evalJavascript('api.rpc.chain.getBlock()');
      return (blockHash as String).substring(2, 10);
    }

    throw Exception('Both userTransBytes and bestnumber are empty');
  }
}
