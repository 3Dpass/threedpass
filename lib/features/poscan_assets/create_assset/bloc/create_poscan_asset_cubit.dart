import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:polkawallet_sdk/storage/types/keyPairData.dart';
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
  })  : initialAcc = initialAccount,
        keyPairData = initialAccount,
        super(CreatePoscanAssetState.initial());

  final TextEditingController accountPassword = TextEditingController();
  final TextEditingController id = TextEditingController();
  final TextEditingController minBalance = TextEditingController();
  final TextEditingController maxSupply = TextEditingController();

  final KeyPairData initialAcc;
  KeyPairData keyPairData;

  void setAcc(final KeyPairData acc) {
    keyPairData = acc;
  }

  void setObject(final UploadedObject? p0) {
    PropValue? newProp = state.propValue;
    if (p0 == null) {
      newProp = null;
    }

    emit(state.copyWith(uploadedObject: p0, propValue: newProp));
  }
}
