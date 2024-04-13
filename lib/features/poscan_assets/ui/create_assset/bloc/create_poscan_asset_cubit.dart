import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:polkawallet_sdk/storage/types/keyPairData.dart';
import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';
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

class CreatePoscanAssetCubit extends Cubit<CreatePoscanAssetState> {
  CreatePoscanAssetCubit({
    required this.appServiceLoaderCubit,
    required this.createAssetUseCase,
  }) : super(
          CreatePoscanAssetState.initial(
            appServiceLoaderCubit.state.keyring.current,
          ),
        );

  final CreateAsset createAssetUseCase;

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController id = TextEditingController();
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

  void setProperty(PropValue? p0) {
    emit(state.copyWith(propValue: p0));
  }

  Future<void> createAsset() async {
    if (formKey.currentState!.validate()) {
      final params = CreateAssetParams(
        admin: state.keyPairData,
        assetId: state.propValue!.propIdx,
        password: passwordController.text,
        minBalance: int.parse(minBalance.text),
        maxSupply: BigInt.parse(maxSupply.text),
        objIdx: state.uploadedObject!.id,
        propIdx: state.propValue!.propIdx,
        updateStatus: () {},
      );
      createAssetUseCase.call(params);
    }
    // appServiceLoaderCubit.state;
  }
}
