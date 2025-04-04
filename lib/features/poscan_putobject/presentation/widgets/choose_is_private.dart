import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/widgets/buttons/two_radio_field.dart';
import 'package:threedpass/features/poscan_putobject/bloc/poscan_putobject_cubit.dart';

class ChooseIsPrivate extends StatelessWidget {
  const ChooseIsPrivate({super.key});

  @override
  Widget build(final BuildContext context) =>
      BlocBuilder<PoscanPutObjectCubit, D3PRPCCubitState>(
        builder: (final context, final state) {
          return TwoRadioField(
            value: state.isPrivate != null
                ? state.isPrivate!
                    ? TwoRadioState.second
                    : TwoRadioState.first
                : TwoRadioState.nothing,
            onChanged: (final res) {
              final cubit = BlocProvider.of<PoscanPutObjectCubit>(context);
              switch (res) {
                case TwoRadioState.first:
                  cubit.setIsPrivate(false);
                  break;
                case TwoRadioState.second:
                  cubit.setIsPrivate(true);
                  break;
                case TwoRadioState.nothing:
                  break;
              }
            },
            label: (
              'put_object_is_public'.tr(),
              'put_object_is_private'.tr(),
            ),
            titleKey: 'obj_visibility_title',
          );
        },
      );
}
