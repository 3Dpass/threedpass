import 'package:threedpass/core/errors/wrong_type_fauilure.dart';
import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';
import 'package:threedpass/core/utils/logger.dart';

class CallSignExtrinsicUtil {
  final AppServiceLoaderCubit appServiceLoaderCubit;

  const CallSignExtrinsicUtil({required this.appServiceLoaderCubit});

  Future<void> abstractExtrinsicCall({
    required final String argsEncoded,
    required final String pubKey,
    required final String password,
    required final List<String> calls,
    required final void Function() updateStatus,
    required final void Function(String) msgIdCallback,
  }) async {
    bool flag = true;

    final dynamic res =
        await appServiceLoaderCubit.state.plugin.sdk.api.universal.callSign(
      pubKey: pubKey,
      password: password,
      calls: calls,
      args: argsEncoded,
      onStatusChange: (final p0) {
        if (flag) {
          // Update status once to detec if extrinsic is accepted
          updateStatus();
          flag = false;
        }
      },
      msgIdCallback: msgIdCallback,
    );
    logger.d(res.toString());
    if (res is Map) {
      final String key = res.keys.first as String;
      if (key == 'error') {
        throw Exception(res[key].toString());
      } else {
        return;
      }
    } else {
      throw WrongTypeFailure(
        'res',
        'Map',
        res.runtimeType.toString(),
      );
    }
  }
}
