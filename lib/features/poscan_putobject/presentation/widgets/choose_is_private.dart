import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/widgets/input/switch_button.dart';
import 'package:threedpass/features/poscan_putobject/bloc/poscan_putobject_cubit.dart';

class ChooseIsPrivate extends StatelessWidget {
  const ChooseIsPrivate({super.key});

  @override
  Widget build(final BuildContext context) =>
      BlocBuilder<PoscanPutObjectCubit, D3PRPCCubitState>(
        builder: (final context, final state) {
          return D3pSwitchButton(
            value: state.isPrivate,
            onChanged: (final value) =>
                BlocProvider.of<PoscanPutObjectCubit>(context)
                    .setIsPrivate(value),
            text: 'put_object_is_private_flag'.tr(),
          );
        },
      );
}
