import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:polkawallet_sdk/storage/types/keyPairData.dart';
import 'package:threedpass/features/preview_page/domain/poscan_property.dart';

part 'd3prpc_cubit.g.dart';

@CopyWith()
class D3PRPCCubitState {
  final KeyPairData account;
  final List<String> chosenHashes;
  final List<PoscanProperty> properties;

  const D3PRPCCubitState({
    required this.account,
    required this.chosenHashes,
    required this.properties,
  });
}

class D3PRPCCubit extends Cubit<D3PRPCCubitState> {
  D3PRPCCubit({
    required this.fileHash,
    required final KeyPairData initialAccount,
  }) : super(
          D3PRPCCubitState(
            account: initialAccount,
            chosenHashes: [],
            properties: [],
          ),
        );

  final TextEditingController nApprovalsController =
      TextEditingController(text: '10');
  final TextEditingController accountPassword = TextEditingController();
  final int fileHash;

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
}
