import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/widgets/buttons/dropdown_button.dart';
import 'package:threedpass/core/widgets/paddings.dart';
import 'package:threedpass/core/widgets/text/d3p_body_medium_text.dart';
import 'package:threedpass/features/poscan_assets/ui/create_assset/bloc/create_poscan_asset_cubit.dart';
import 'package:threedpass/features/poscan_assets/ui/create_assset/presentation/widgets/prop_value_dropdown_item.dart';
import 'package:threedpass/features/poscan_objects_query/domain/entities/prop_value.dart';
import 'package:threedpass/features/poscan_objects_query/domain/entities/uploaded_object.dart';

class CreateAssetChoosePropValue extends StatelessWidget {
  const CreateAssetChoosePropValue({super.key});

  @override
  Widget build(final BuildContext context) {
    final cpac = BlocProvider.of<CreatePoscanAssetCubit>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const D3pBodyMediumText('create_asset_choose_prop'),
        const H4(),
        BlocBuilder<CreatePoscanAssetCubit, CreatePoscanAssetState>(
          buildWhen: (final previous, final current) =>
              previous.propValue != current.propValue ||
              previous.uploadedObject != current.uploadedObject,
          builder: (final context, final state) {
            final uploadedObject = state.uploadedObject;
            final items = uploadedObject?.props
                .map(
                  (final e) => DropdownMenuItem<PropValue>(
                    value: e,
                    child: PropValueDropdownItem(e),
                  ),
                )
                .toList();
            return D3pDropdownButton<PropValue>(
              items: items,
              onChanged: cpac.setProperty,
              value: state.propValue,
            );
          },
        ),
      ],
    );
  }
}
