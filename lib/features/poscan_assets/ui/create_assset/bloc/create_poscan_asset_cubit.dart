import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:polkawallet_sdk/storage/types/keyPairData.dart';
import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';
import 'package:threedpass/features/poscan_objects_query/domain/entities/prop_value.dart';
import 'package:threedpass/features/poscan_objects_query/domain/entities/uploaded_object.dart';

part 'create_poscan_asset_cubit.g.dart';

@CopyWith()
class CreatePoscanAssetState {
  final UploadedObject? uploadedObject;
  final PropValue? propValue;

  CreatePoscanAssetState({
    required this.propValue,
    required this.uploadedObject,
  });

  CreatePoscanAssetState.initial()
      : propValue = null,
        uploadedObject = null;
}

class CreatePoscanAssetCubit extends Cubit<CreatePoscanAssetState> {
  CreatePoscanAssetCubit({
    required final KeyPairData initialAccount,
    required this.appServiceLoaderCubit,
  })  : initialAcc = initialAccount,
        keyPairData = initialAccount,
        super(CreatePoscanAssetState.initial());

  final TextEditingController accountPassword = TextEditingController();
  final TextEditingController id = TextEditingController();
  final TextEditingController minBalance = TextEditingController();
  final TextEditingController maxSupply = TextEditingController();

  final formKey = GlobalKey<FormState>();

  final AppServiceLoaderCubit appServiceLoaderCubit;

  final KeyPairData initialAcc;
  KeyPairData keyPairData;

  void setAcc(final KeyPairData acc) {
    keyPairData = acc;
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
    if (formKey.currentState!.validate()) {}
    // appServiceLoaderCubit.state;
  }
}
