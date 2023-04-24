// ignore_for_file: avoid_dynamic_calls

import 'package:threedpass/core/polkawallet/app_service.dart';

extension EncodeAddress on AppService {
  Future<String> encodeAddress(
    final String accountId,
  ) async {
    final service = plugin.sdk.api.account.service;
    final ss58Format = networkStateData.ss58Format;

    // I know this is not debuggable and unreadable. But this is the way it works.
    var res = '';
    try {
      final d1 = await service.encodeAddress([accountId], [ss58Format]);
      res = d1![ss58Format.toString()][accountId] as String;
    } on Object {
      res = 'ERROR';
    }

    return res;
  }
}
