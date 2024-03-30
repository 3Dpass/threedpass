import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/widgets/buttons/dropdown_button.dart';
import 'package:threedpass/features/poscan_assets/create_assset/bloc/create_poscan_asset_cubit.dart';
import 'package:threedpass/features/poscan_assets/create_assset/widgets/uploaded_object_dropdown_item.dart';
import 'package:threedpass/features/poscan_objects_query/bloc/poscan_objects_cubit.dart';
import 'package:threedpass/features/poscan_objects_query/domain/entities/uploaded_object.dart';

class CreateAssetChooseObject extends StatelessWidget {
  const CreateAssetChooseObject({super.key});

  @override
  Widget build(final BuildContext context) {
    final uploadedObjectsCubit = BlocProvider.of<PoscanObjectsCubit>(context);
    final objects = uploadedObjectsCubit.state.objects;
    final items = objects
        .map(
          (final e) => DropdownMenuItem<UploadedObject>(
            child: UploadedObjectDropdownItem(e),
          ),
        )
        .toList();
    final cpac = BlocProvider.of<CreatePoscanAssetCubit>(context);
    return BlocBuilder<CreatePoscanAssetCubit, CreatePoscanAssetState>(
      builder: (final context, final state) {
        return D3pDropdownButton<UploadedObject>(
          context: context,
          items: items,
          onChanged: cpac.setObject,
          value: state.uploadedObject,
        );
      },
    );
  }
}
