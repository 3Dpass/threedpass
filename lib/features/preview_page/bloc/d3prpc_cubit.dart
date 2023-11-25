import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:polkawallet_sdk/storage/types/keyPairData.dart';

part 'd3prpc_cubit.g.dart';

@CopyWith()
class D3PRPCCubitState {
  final List<String> chosenHashes;
  final KeyPairData account;

  const D3PRPCCubitState({
    required this.account,
    required this.chosenHashes,
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
}
