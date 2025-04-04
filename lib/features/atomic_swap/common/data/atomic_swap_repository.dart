import 'package:threedpass/core/polkawallet/utils/call_signed_extrinsic.dart';
import 'package:threedpass/features/atomic_swap/create/domain/entities/create_atomic_swap_params.dart';

abstract class AtomicSwapRepository {
  const AtomicSwapRepository();

  Future<void> create({
    required final CreateAtomicSwapParams params,
    required final void Function() updateStatus,
    required final void Function(String) msgIdCallback,
  });
}

class AtomicSwapRepositoryImpl implements AtomicSwapRepository {
  const AtomicSwapRepositoryImpl({
    required this.callSignExtrinsicUtil,
  });

  final CallSignExtrinsicUtil callSignExtrinsicUtil;

  @override
  Future<void> create({
    required final CreateAtomicSwapParams params,
    required final void Function() updateStatus,
    required final void Function(String) msgIdCallback,
  }) async {
    // final args = [
    //   params.assetId,
    //   params.admin.pubKey!,
    //   params.minBalance,
    //   // keys https://github.com/3Dpass/3DP/blob/3134dad0ed1502462620ba84a4dee4e1b109996b/pallets/poscan-assets/src/types.rs#L41
    // ];

    // if (params.objDetails != null) {
    //   final maxSupply = BigInt.parse(params.objDetails!.maxSupply);
    //   final objDataRaw = {
    //     'obj_idx': int.parse(params.objDetails!.objIdx),
    //     'prop_idx': int.parse(params.objDetails!.propIdx),
    //     'max_supply': BigIntJsonHelper.encode(maxSupply),
    //   };
    //   args.add(objDataRaw);
    // } else {
    //   args.add(NoneMock());
    // }

    // String argsEncoded = '';
    // argsEncoded = const JsonEncoder().convert(args);
    // argsEncoded = BigIntJsonHelper.replace(argsEncoded);

    // logger.t(argsEncoded);

    // return callSignExtrinsicUtil.abstractExtrinsicCall(
    //   argsEncoded: argsEncoded,
    //   calls: ['tx', 'poscanAssets', 'create'],
    //   pubKey: params.admin.pubKey!,
    //   password: params.password,
    //   updateStatus: updateStatus,
    //   msgIdCallback: msgIdCallback,
    // );
  }
}
