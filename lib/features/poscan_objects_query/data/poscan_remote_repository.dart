import 'package:super_core/super_core.dart';
import 'package:threedpass/core/errors/parse_failure.dart';
import 'package:threedpass/core/errors/type_mismatch.dart';
import 'package:threedpass/core/polkawallet/app_service.dart';
import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';
import 'package:threedpass/core/polkawallet/failures.dart';
import 'package:threedpass/core/utils/logger.dart';
import 'package:threedpass/core/utils/to_string_dynamic.dart';
import 'package:threedpass/features/poscan_objects_query/domain/entities/uploaded_object.dart';

class PoScanRemoteRepository {
  final AppServiceLoaderCubit appServiceLoaderCubit;

  PoScanRemoteRepository({
    required this.appServiceLoaderCubit,
  });

  Future<Either<Failure, int>> objCount() async {
    if (appServiceLoaderCubit.state.status != AppServiceInitStatus.connected) {
      return const Either.left(AppServiceIsNotInitialized());
    }

    final dynamic res =
        await appServiceLoaderCubit.state.plugin.sdk.api.universal.callNoSign(
      calls: ['query', 'poScan', 'objCount'],
      args: null,
      sendNullAsArg: false,
    );

    final resStr = res.toString();
    final maybeInt = int.tryParse(resStr);
    if (maybeInt != null) {
      return Either.right(maybeInt);
    } else {
      return Either.left(NoDataFailure(resStr));
    }
  }

  Future<Either<Failure, List<int>>> owners(final String accountId) async {
    if (appServiceLoaderCubit.state.status != AppServiceInitStatus.connected) {
      return const Either.left(AppServiceIsNotInitialized());
    }

    final dynamic res =
        await appServiceLoaderCubit.state.plugin.sdk.api.universal.callNoSign(
      calls: ['query', 'poScan', 'owners'],
      args: '["$accountId"]',
      sendNullAsArg: false,
    );

    final resStr = res.toString();
    logger.v('PALLET CALL RESULT: $resStr');
    try {
      final resList = (res as List)
          .map((final dynamic e) => int.parse(e.toString()))
          .toList();
      return Either.right(resList);
    } on Object catch (e) {
      return Either.left(BadDataFailure(e.toString()));
    }
  }

  Future<Either<Failure, UploadedObject>> objects(
    final int id,
  ) async {
    if (appServiceLoaderCubit.state.status != AppServiceInitStatus.connected) {
      return const Either.left(AppServiceIsNotInitialized());
    }

    final dynamic res =
        await appServiceLoaderCubit.state.plugin.sdk.api.universal.callNoSign(
      calls: ['query', 'poScan', 'objects'],
      args: '["$id"]',
      sendNullAsArg: false,
    );
    if (res is Map) {
      try {
        return Either.right(
          UploadedObject.fromJson(
            res.toStringDynamic(),
            DateTime.now(),
            id,
          ),
        );
      } on Object catch (e) {
        return Either.left(
          ParseFailure(
            'Could not parse UploadedObject ' + e.toString(),
          ),
        );
      }
    } else {
      return Either.left(
        TypeMismatch(
          varName: 'res',
          expected: 'Map',
          actual: res.runtimeType.toString(),
        ),
      );
    }
  }
}
