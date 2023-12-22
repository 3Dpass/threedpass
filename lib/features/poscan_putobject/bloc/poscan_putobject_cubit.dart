import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:polkawallet_sdk/storage/types/keyPairData.dart';
import 'package:threedpass/core/widgets/default_loading_dialog.dart';
import 'package:threedpass/features/poscan_putobject/domain/entities/poscan_categories.dart';
import 'package:threedpass/features/poscan_putobject/domain/entities/poscan_property.dart';
import 'package:threedpass/features/poscan_putobject/domain/usecases/put_object_usecase.dart';
import 'package:threedpass/features/preview_page/bloc/outer_context_cubit.dart';

part 'poscan_putobject_cubit.g.dart';

@CopyWith()
class D3PRPCCubitState {
  final KeyPairData account;
  final List<String> chosenHashes;
  final List<PoscanProperty> properties;
  final MapPoscanCategory chosenCategory;

  const D3PRPCCubitState({
    required this.account,
    required this.chosenHashes,
    required this.properties,
    required this.chosenCategory,
  });
}

class PoscanPutObjectCubit extends Cubit<D3PRPCCubitState> {
  PoscanPutObjectCubit({
    required this.fileHash,
    required this.filePath,
    required this.putObjectUseCase,
    required this.localSnapshotName,
    required final List<String> initialHashes,
    required final KeyPairData initialAccount,
  }) : super(
          D3PRPCCubitState(
            account: initialAccount,
            chosenHashes: initialHashes,
            properties: [],
            chosenCategory: PoscanCategories.first,
          ),
        );

  final PutObject putObjectUseCase;

  final TextEditingController nApprovalsController =
      TextEditingController(text: '10');
  final TextEditingController accountPassword = TextEditingController();
  final int fileHash;
  final String filePath;
  final String localSnapshotName;

  bool fastCheckPassed = false;

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
    if (state.properties.contains(prop)) {
      removeProp(prop);
    } else {
      addProp(prop);
    }
  }

  void addProp(final PoscanProperty prop) {
    final newList = List<PoscanProperty>.from(state.properties);
    newList.add(prop);

    emit(state.copyWith(properties: newList));
  }

  void removeProp(final PoscanProperty prop) {
    final newList = List<PoscanProperty>.from(state.properties);
    newList.remove(prop);

    emit(state.copyWith(properties: newList));
  }

  void changeCategory(final MapPoscanCategory cat) {
    emit(state.copyWith(chosenCategory: cat));
  }

  void setAcc(final KeyPairData acc) {
    emit(state.copyWith(account: acc));
  }

  Future<void> submit(BuildContext context) async {
    DefaultLoadingDialog.show(context);

    fastCheckPassed = false;

    final params = PutObjectParams(
      localSnapshotName: localSnapshotName,
      account: state.account,
      password: accountPassword.text,
      nApprovals: int.parse(nApprovalsController.text),
      pathToFile: filePath,
      categoryFabric: state.chosenCategory,
      hashes: state.chosenHashes,
      propValues: state.properties.map((final e) => e.propValue).toList(),
      updateStatus: () {
        fastCheckPassed = true;
        DefaultLoadingDialog.hide(context);
        BlocProvider.of<OuterContextCubit>(context).state.router.pop();
      },
    );
    final res = await putObjectUseCase.call(params);

    if (!fastCheckPassed) {
      String message = '';
      res.when(
        left: (final f) {
          message = f.cause ?? '';
        },
        right: (final _) {},
      );
      DefaultLoadingDialog.hide(context);
      unawaited(Fluttertoast.showToast(msg: message));
    }

    // TODO Set notification final
  }
}
