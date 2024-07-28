import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:polkawallet_sdk/storage/types/keyPairData.dart';
import 'package:super_core/super_core.dart';
import 'package:threedpass/core/utils/extrinsic_show_loading_mixin.dart';
import 'package:threedpass/features/poscan_putobject/data/default_poscan_properties.dart';
import 'package:threedpass/features/poscan_putobject/domain/entities/poscan_categories.dart';
import 'package:threedpass/features/poscan_putobject/domain/entities/poscan_property.dart';
import 'package:threedpass/features/poscan_putobject/domain/usecases/put_object_usecase.dart';

part 'poscan_putobject_cubit.g.dart';

@CopyWith()
class D3PRPCCubitState {
  final KeyPairData account;
  final List<String> chosenHashes;
  final List<PoscanProperty> defaultProperties;
  final List<PoscanProperty> chosenProperties;
  final MapPoscanCategory chosenCategory;

  const D3PRPCCubitState({
    required this.account,
    required this.chosenHashes,
    required this.defaultProperties,
    required this.chosenProperties,
    required this.chosenCategory,
  });
}

class PoscanPutObjectCubit extends Cubit<D3PRPCCubitState>
    with ExtrinsicShowLoadingMixin {
  PoscanPutObjectCubit({
    required this.fileHash,
    required this.filePath,
    required this.putObjectUseCase,
    required this.localSnapshotName,
    required this.outerRouter,
    required final List<String> initialHashes,
    required final KeyPairData initialAccount,
  }) : super(
          D3PRPCCubitState(
            account: initialAccount,
            chosenHashes: initialHashes,
            defaultProperties: defaultProperties,
            chosenProperties: [],
            chosenCategory: PoscanCategories.first,
          ),
        );

  @override
  final StackRouter outerRouter;

  final PutObject putObjectUseCase;

  final TextEditingController nApprovalsController =
      TextEditingController(text: '10');
  final int fileHash;
  final String filePath;
  final String localSnapshotName;

  void toggleHash(final String hash) {
    if (state.chosenHashes.contains(hash)) {
      removeHash(hash);
    } else {
      addHash(hash);
    }
  }

  void addHash(final String hash) {
    final newList = List<String>.from(state.chosenHashes);
    newList.add(hash);

    emit(state.copyWith(chosenHashes: newList));
  }

  void removeHash(final String hash) {
    final newList = List<String>.from(state.chosenHashes);
    newList.remove(hash);

    emit(state.copyWith(chosenHashes: newList));
  }

  void toggleProp(final PoscanProperty prop) {
    if (state.chosenProperties.contains(prop)) {
      removeProp(prop);
    } else {
      addProp(prop);
    }
  }

  void addProp(final PoscanProperty prop) {
    final newList = List<PoscanProperty>.from(state.chosenProperties);
    newList.add(prop);

    emit(state.copyWith(chosenProperties: newList));
  }

  void removeProp(final PoscanProperty prop) {
    final newList = List<PoscanProperty>.from(state.chosenProperties);
    newList.remove(prop);

    emit(state.copyWith(chosenProperties: newList));
  }

  void editProp(final PoscanProperty prop) {
    final newList = List<PoscanProperty>.from(state.defaultProperties);
    final chosenList = List<PoscanProperty>.from(state.chosenProperties);
    final index =
        newList.indexWhere((final existingProp) => existingProp == prop);
    newList[index] = prop;

    if (state.chosenProperties.contains(prop)) {
      final index =
          chosenList.indexWhere((final existingProp) => existingProp == prop);
      chosenList[index] = prop;
    }

    emit(
      state.copyWith(
        defaultProperties: newList,
        chosenProperties: chosenList,
      ),
    );
  }

  void changeCategory(final MapPoscanCategory cat) {
    emit(state.copyWith(chosenCategory: cat));
  }

  void setAcc(final KeyPairData acc) {
    emit(state.copyWith(account: acc));
  }

  Future<Either<Failure, void>> callExtrinsic(
    final BuildContext context,
  ) async {
    final params = PutObjectParams(
      localSnapshotName: localSnapshotName,
      account: state.account,
      password: passwordController.text,
      nApprovals: int.parse(nApprovalsController.text),
      pathToFile: filePath,
      categoryFabric: state.chosenCategory,
      hashes: state.chosenHashes,
      propValues: state.chosenProperties.map((final e) => e.propValue).toList(),
      updateStatus: () => updateStatus(context),
    );
    final res = await putObjectUseCase.call(params);
    return res;
  }

  Future<void> submit(final BuildContext context) async {
    await showLoader(
      context: context,
      call: () => callExtrinsic(context),
    );
  }
}
