import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/utils/validators.dart';
import 'package:threedpass/core/widgets/input/textformfield/textformfield.dart';
import 'package:threedpass/core/widgets/paddings.dart';
import 'package:threedpass/core/widgets/text/d3p_body_medium_text.dart';
import 'package:threedpass/features/poscan_putobject/bloc/poscan_putobject_cubit.dart';

class ChooseApprovals extends StatelessWidget {
  const ChooseApprovals({super.key});

  @override
  Widget build(final BuildContext context) {
    final cubit = BlocProvider.of<PoscanPutObjectCubit>(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const D3pBodyMediumText('poscan_putobject_choose_napprovals'),
        const H4(),
        D3pTextFormField(
          controller: cubit.nApprovalsController,
          hintText: 'n_approvals_hint'.tr(),
          validator: Validators.onlyInt,
          keyboardType: TextInputType.number,
        ),
      ],
    );
  }
}
