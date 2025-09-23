import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:threedpass/core/widgets/other/fast_rich_text.dart';
import 'package:threedpass/features/atomic_swap/basic/domain/enitites/basic_pending_atomic_swap_data.dart';

class HashProofText extends StatelessWidget {
  const HashProofText({
    required this.swap,
    this.secondaryText,
  });

  final BasicPendingAtomicSwapData swap;
  final String? secondaryText;

  @override
  Widget build(BuildContext context) {
    return FastRichText(
      mainText: swap.hashProof.prefixValue,
      needSpace: true,
      secondaryText: secondaryText?.tr() ?? 'hash_proof_prefix'.tr(),
    );
  }
}
