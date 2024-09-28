import 'package:threedpass/core/polkawallet/app_service.dart';
import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';
import 'package:threedpass/core/utils/logger.dart';
import 'package:threedpass/core/utils/to_string_dynamic.dart';
import 'package:threedpass/features/poscan_objects_query/domain/entities/uploaded_object.dart';

class PoScanRemoteRepository {
  final AppServiceLoaderCubit appServiceLoaderCubit;

  PoScanRemoteRepository({
    required this.appServiceLoaderCubit,
  });

  Future<int> objCount() async {
    if (appServiceLoaderCubit.state.status != AppServiceInitStatus.connected) {
      throw Exception('AppService is not initialized');
    }

    final dynamic res =
        await appServiceLoaderCubit.state.plugin.sdk.api.universal.callNoSign(
      calls: ['query', 'poScan', 'objCount'],
      args: null,
      sendNullAsArg: false,
    );

    logger.t('Objects count on storage res:$res');

    return int.parse(res.toString());
  }

  Future<List<int>> owners(final String accountId) async {
    final dynamic res =
        await appServiceLoaderCubit.state.plugin.sdk.api.universal.callNoSign(
      calls: ['query', 'poScan', 'owners'],
      args: '["$accountId"]',
      sendNullAsArg: false,
    );

    final resStr = res.toString();
    logger.t('PALLET CALL RESULT: $resStr');

    final resList = (res as List)
        .map((final dynamic e) => int.parse(e.toString()))
        .toList();
    return resList;
  }

  Future<UploadedObject> objects(
    final int id,
  ) async {
    if (appServiceLoaderCubit.state.status != AppServiceInitStatus.connected) {
      throw Exception('AppService is not initialized');
    }

    final dynamic res =
        await appServiceLoaderCubit.state.plugin.sdk.api.universal.callNoSign(
      calls: ['query', 'poScan', 'objects'],
      args: '["$id"]',
      sendNullAsArg: false,
    );

    return UploadedObject.fromJson(
      (res as Map).toStringDynamic(),
      DateTime.now(),
      id,
    );
  }
}
