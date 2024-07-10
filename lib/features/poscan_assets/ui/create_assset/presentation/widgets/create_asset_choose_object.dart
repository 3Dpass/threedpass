import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/widgets/buttons/dropdown_button.dart';
import 'package:threedpass/core/widgets/paddings.dart';
import 'package:threedpass/core/widgets/text/d3p_body_medium_text.dart';
import 'package:threedpass/features/poscan_assets/ui/create_assset/bloc/create_poscan_asset_cubit.dart';
import 'package:threedpass/features/poscan_assets/ui/create_assset/presentation/widgets/uploaded_object_dropdown_item.dart';
import 'package:threedpass/features/poscan_objects_query/bloc/poscan_objects_cubit.dart';
import 'package:threedpass/features/poscan_objects_query/domain/entities/uploaded_object.dart';

// TODO ISAR
// class CreateAssetChooseObject extends StatelessWidget {
//   const CreateAssetChooseObject({super.key});

//   @override
//   Widget build(final BuildContext context) {
//     final uploadedObjectsCubit = BlocProvider.of<PoscanObjectsCubit>(context);
//     final currentAcc =
//         BlocProvider.of<CreatePoscanAssetCubit>(context).state.keyPairData;

//     final objects = uploadedObjectsCubit.state.objects.where(
//       (final obj) =>
//           obj.status == UploadedObjectStatus.approved &&
//           obj.owner == currentAcc.address,
//     );
//     final items = objects
//         .map(
//           (final e) => DropdownMenuItem<UploadedObject>(
//             value: e,
//             child: UploadedObjectDropdownItem(e),
//           ),
//         )
//         .toList();
//     final cpac = BlocProvider.of<CreatePoscanAssetCubit>(context);
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         const D3pBodyMediumText('create_asset_choose_object'),
//         const SizedBoxH4(),
//         BlocBuilder<CreatePoscanAssetCubit, CreatePoscanAssetState>(
//           builder: (final context, final state) {
//             return D3pDropdownButton<UploadedObject>(
//               context: context,
//               items: items,
//               onChanged: cpac.setObject,
//               value: state.uploadedObject,
//             );
//           },
//         ),
//       ],
//     );
//   }
// }
