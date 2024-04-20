import 'package:auto_route/src/router/controller/routing_controller.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:polkawallet_sdk/storage/types/keyPairData.dart';
import 'package:super_core/super_core.dart';
import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';
import 'package:threedpass/core/utils/extrinsic_show_loading_mixin.dart';
import 'package:threedpass/features/poscan_assets/domain/use_cases/create_asset.dart';
import 'package:threedpass/features/poscan_objects_query/domain/entities/prop_value.dart';
import 'package:threedpass/features/poscan_objects_query/domain/entities/uploaded_object.dart';

part 'create_poscan_asset_cubit.g.dart';

@CopyWith()
class CreatePoscanAssetState {
  final UploadedObject? uploadedObject;
  final PropValue? propValue;
  final KeyPairData keyPairData;

  CreatePoscanAssetState({
    required this.propValue,
    required this.uploadedObject,
    required this.keyPairData,
  });

  CreatePoscanAssetState.initial(this.keyPairData)
      : propValue = null,
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

  final CreateAsset createAssetUseCase;

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController assetId = TextEditingController();
  final TextEditingController minBalance = TextEditingController();
  final TextEditingController maxSupply = TextEditingController();

  final formKey = GlobalKey<FormState>();

  final AppServiceLoaderCubit appServiceLoaderCubit;

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

  Future<Either<Failure, void>> callExtrinsic(
    final BuildContext context,
  ) async {
    final params = CreateAssetParams(
      admin: state.keyPairData,
      assetId: int.parse(assetId.text),
      password: passwordController.text,
      minBalance: int.parse(minBalance.text),
      maxSupply: BigInt.parse(maxSupply.text),
      objIdx: state.uploadedObject!.id,
      propIdx: state.propValue!.propIdx,
      updateStatus: () => updateStatus(context),
    );
    final res = createAssetUseCase.call(params);
    return res;
  }

  Future<void> createAsset(final BuildContext context) async {
    if (formKey.currentState!.validate()) {
      await showLoader(
        context: context,
        call: () => callExtrinsic(context),
      );
    }
  }
}
