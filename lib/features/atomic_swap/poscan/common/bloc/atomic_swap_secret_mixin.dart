import 'package:flutter/material.dart';
import 'package:threedpass/features/atomic_swap/poscan/create/domain/usecases/calc_hashed_proof.dart';
import 'package:threedpass/setup.dart';

mixin AtomicSwapSecretMixin {
  final secretInputController = TextEditingController();
  final hashProofController = TextEditingController();
  final CalcHashedProof calcHashedProof = getIt<CalcHashedProof>();

  initSecretInput() {
    secretInputController.addListener(
      () => secretInputController.text.isEmpty
          ? hashProofController.text = ''
          : calcHashedProof.call(secretInputController.text).then(
              (final hashedProof) => hashProofController.text = hashedProof),
    );
  }
}
