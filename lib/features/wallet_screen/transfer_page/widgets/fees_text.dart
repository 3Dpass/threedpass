import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/polkawallet/utils/balance_utils.dart';
import 'package:threedpass/core/widgets/progress_indicator/progress_indicator.dart';
import 'package:threedpass/core/widgets/text/d3p_body_large_text.dart';
import 'package:threedpass/features/wallet_screen/transfer_page/bloc/transfer_info_bloc.dart';

class FeesText extends StatelessWidget {
  const FeesText({
    final Key? key,
  }) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    return BlocBuilder<TransferInfoBloc, TransferInfoBlocState>(
      builder: (final context, final state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            D3pBodyLargeText('estimated_transfer_fee'.tr()),
            state.fees != null
                ? Text(
                    BalanceUtils.balance(state.fees?.partialFee.toString(), 12),
                  )
                : const D3pProgressIndicator(
                    size: 15,
                    strokeWidth: 2,
                  ),
          ],
        );
      },
    );
  }
}
