import 'package:threedpass/core/chains/domain/entities/account_id.dart';
import 'package:threedpass/core/chains/domain/entities/address.dart';
import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';
import 'package:threedpass/core/usecase.dart';
import 'package:threedpass/core/utils/logger.dart';

class EncodeAddress extends UseCase<Address, AccountId> {
  final AppServiceLoaderCubit appServiceLoaderCubit;

  const EncodeAddress({
    required this.appServiceLoaderCubit,
  });

  @override
  Future<Address> call(AccountId address) async {
    final ss58Format = appServiceLoaderCubit.state.networkStateData.ss58Format;
    final service = appServiceLoaderCubit.state.plugin.sdk.api.account.service;

    final d1 = await service.encodeAddress([address], [ss58Format]);
    final res = d1!.values.first.values.first as String;
    logger.t(
        'Original address: $address | Encoded address result: $d1 | parsed address: $res');

    return res;
  }
}
