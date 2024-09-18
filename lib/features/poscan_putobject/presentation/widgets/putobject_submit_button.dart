import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/theme/d3p_special_styles.dart';
import 'package:threedpass/core/widgets/buttons/elevated_button.dart';
import 'package:threedpass/core/widgets/paddings.dart';
import 'package:threedpass/features/poscan_putobject/bloc/poscan_putobject_cubit.dart';

class PutObjectSubmitButton extends StatelessWidget {
  const PutObjectSubmitButton({super.key});

  @override
  Widget build(final BuildContext context) {
    final textStyle = Theme.of(context).customTextStyles;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'poscan_putobject_fees_warning'.tr(),
          style: textStyle.secondaryText,
        ),
        const SizedBox(height: 2),
        D3pElevatedButton(
          text: 'sign_extrinsic'.tr(),
          onPressed: () async => BlocProvider.of<PoscanPutObjectCubit>(context)
              .submitExtrinsic(context),
        ),
        const H24(),
      ],
    );
  }
}
