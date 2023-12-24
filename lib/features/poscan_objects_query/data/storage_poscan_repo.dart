import 'package:super_core/super_core.dart';
import 'package:threedpass/core/errors/parse_failure.dart';
import 'package:threedpass/core/errors/type_mismatch.dart';
import 'package:threedpass/core/polkawallet/app_service.dart';
import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';
import 'package:threedpass/core/polkawallet/failures.dart';
import 'package:threedpass/features/poscan_objects_query/domain/entities/uploaded_object.dart';

class StoragePoscanRepository {
  final AppServiceLoaderCubit appServiceLoaderCubit;

  StoragePoscanRepository({
    required this.appServiceLoaderCubit,
  });

  Future<Either<Failure, int>> objCount() async {
    if (appServiceLoaderCubit.state.status != AppServiceInitStatus.connected) {
      return const Either.left(AppServiceIsNotInitialized());
    }

    final dynamic res =
        await appServiceLoaderCubit.state.plugin.sdk.api.universal.callNoSign(
      second: 'poScan',
      third: 'objCount',
      args: null,
    );

    final resStr = res.toString();
    final maybeInt = int.tryParse(resStr);
    if (maybeInt != null) {
      return Either.right(maybeInt);
    } else {
      return Either.left(NoDataFailure(resStr));
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
      second: 'poScan',
      third: 'objects',
      args: ['$id'],
    );
    if (res is Map) {
      try {
        return Either.right(
          UploadedObjectFabric(id: id, raw: res).object(),
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
