import 'package:super_core/super_core.dart';
import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';
import 'package:threedpass/core/polkawallet/utils/log.dart';

class CallSignExtrinsicUtil {
  final AppServiceLoaderCubit appServiceLoaderCubit;

  const CallSignExtrinsicUtil({required this.appServiceLoaderCubit});

  Future<Either<Failure, void>> abstractExtrinsicCall({
    required final String argsEncoded,
    required final String pubKey,
    required final String password,
    required final List<String> calls,
    required final void Function() updateStatus,
    required final void Function(String) msgIdCallback,
  }) async {
    try {
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
      logD(res.toString());
      if (res is Map) {
        final String key = res.keys.first as String;
        if (key == 'error') {
          return Either.left(NoDataFailure(res[key].toString()));
        } else {
          return const Either.right(null);
        }
      } else {
        return const Either.left(NoDataFailure('res is not a Map'));
      }
    } on Object catch (e) {
      logE(e, StackTrace.current);
      return Either.left(NoDataFailure(e.toString()));
    }
  }
}
