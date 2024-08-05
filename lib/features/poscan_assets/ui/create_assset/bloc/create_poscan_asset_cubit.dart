import 'package:auto_route/auto_route.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:polkawallet_sdk/storage/types/keyPairData.dart';
import 'package:super_core/super_core.dart';
import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';
import 'package:threedpass/core/utils/extrinsic_show_loading_mixin.dart';
import 'package:threedpass/features/poscan_assets/domain/entities/obj_details.dart';
import 'package:threedpass/features/poscan_assets/domain/use_cases/create_asset.dart';
import 'package:threedpass/features/poscan_objects_query/domain/entities/prop_value.dart';
import 'package:threedpass/features/poscan_objects_query/domain/entities/uploaded_object.dart';

part 'create_poscan_asset_cubit.g.dart';

@CopyWith()
class CreatePoscanAssetState {
  final UploadedObject? uploadedObject;
  final PropValue? propValue;
  final bool includeObject;
  final KeyPairData keyPairData;

  CreatePoscanAssetState({
    required this.propValue,
    required this.uploadedObject,
    required this.keyPairData,
    required this.includeObject,
  });

  CreatePoscanAssetState.initial(this.keyPairData)
      : includeObject = false,
        propValue = null,
        uploadedObject = null;
}

class CreatePoscanAssetCubit extends Cubit<CreatePoscanAssetState>
    with ExtrinsicShowLoadingMixin {
  CreatePoscanAssetCubit({
    required this.appServiceLoaderCubit,
    required this.createAssetUseCase,
    required this.outerRouter,
  }) : super(
          CreatePoscanAssetState.initial(
            appServiceLoaderCubit.state.keyring.current,
          ),
        );

  @override
  final StackRouter outerRouter;
  final AppServiceLoaderCubit appServiceLoaderCubit;
  final CreateAsset createAssetUseCase;

  final TextEditingController assetId = TextEditingController();
  final TextEditingController minBalance = TextEditingController();
  final TextEditingController maxSupply = TextEditingController();

  // final KeyPairData initialAcc;

  void setAcc(final KeyPairData acc) {
    emit(state.copyWith(keyPairData: acc));
  }

  void setObject(final UploadedObject? p0) {
    PropValue? newProp = state.propValue;
    if (state.uploadedObject != p0) {
      newProp = null;
    }

    emit(state.copyWith(uploadedObject: p0, propValue: newProp));
  }

  void setProperty(final PropValue? p0) {
    emit(state.copyWith(propValue: p0));
  }

  void switchIncludeObject() {
    emit(state.copyWith(includeObject: !state.includeObject));
  }

  @override
  Future<Either<Failure, void>> callExtrinsic(
    final BuildContext context,
  ) async {
    ObjDetailsPoscanAsset? objDetails;
    if (state.includeObject) {
      objDetails = ObjDetailsPoscanAsset.fromSuperTypes(
        objIdx: state.uploadedObject!.id,
        propIdx: state.propValue!.propIdx,
        maxSupply: BigInt.parse(maxSupply.text),
      );
    }

    final params = CreateAssetParams(
      admin: state.keyPairData,
      assetId: int.parse(assetId.text),
      password: passwordController.text,
      minBalance: int.parse(minBalance.text),
      objDetails: objDetails,
      updateStatus: () => updateStatus(context),
    );
    final res = createAssetUseCase.call(params);
    return res;
  }
}
