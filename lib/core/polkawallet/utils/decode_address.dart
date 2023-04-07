import 'package:logger/logger.dart';
import 'package:threedpass/core/polkawallet/app_service.dart';
import 'package:threedpass/setup.dart';

extension DecodeAddress on AppService {
  Future<String> decodeAddress(
    final String address,
  ) async {
    final service = plugin.sdk.api.account.service;
    final ss58Format = networkStateData.ss58Format;

    // I know this is not debuggable and unreadable. But this is the way it works.
    var res = '';
    try {
      final d1 = await service.decodeAddress([address!]);
      res = d1!.keys.first as String;
    } on Object catch (e) {
      getIt<Logger>().e(e);
      res = 'ERROR';
    }

    return res;
  }
}
