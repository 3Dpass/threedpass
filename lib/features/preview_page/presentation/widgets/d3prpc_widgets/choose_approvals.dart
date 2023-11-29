import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/widgets/input/textformfield/textformfield.dart';
import 'package:threedpass/core/widgets/paddings.dart';
import 'package:threedpass/core/widgets/text/d3p_body_medium_text.dart';
import 'package:threedpass/features/preview_page/bloc/d3prpc_cubit.dart';

class ChooseApprovals extends StatelessWidget {
  const ChooseApprovals({super.key});

  @override
  Widget build(final BuildContext context) {
    final cubit = BlocProvider.of<D3PRPCCubit>(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBoxH16(),
        const D3pBodyMediumText('d3rpc_subtitle_choose_napprovals'),
        const SizedBoxH4(),
        D3pTextFormField(
          controller: cubit.nApprovalsController,
          hintText: 'n_approvals_hint'.tr(),
          validator: validate,
          keyboardType: TextInputType.number,
        ),
      ],
    );
  }

  String? validate(final String? p0) {
    final res = int.tryParse(p0 ?? '');

    return res != null && res > 0 ? null : 'error_wrong_amount_int'.tr();
  }
}
