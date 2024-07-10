import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/features/other/form_option/form_option.dart';
import 'package:threedpass/features/poscan_assets/ui/create_assset/bloc/create_poscan_asset_cubit.dart';
import 'package:threedpass/features/poscan_assets/ui/create_assset/presentation/widgets/create_asset_choose_object.dart';
import 'package:threedpass/features/poscan_assets/ui/create_assset/presentation/widgets/create_asset_choose_prop_value.dart';
import 'package:threedpass/features/poscan_assets/ui/create_assset/presentation/widgets/create_asset_max_supply.dart';

// TODO ISAR
// class CreateAssetObjectOption extends StatelessWidget {
//   const CreateAssetObjectOption({super.key});

//   @override
//   Widget build(final BuildContext context) {
//     final bloc = BlocProvider.of<CreatePoscanAssetCubit>(context);
//     final createPoscanAssetState = bloc.state;

//     return FormOption(
//       buildChildren: buildChildren,
//       titleLocalizeKey: 'create_asset_options_label',
//       initialValue: createPoscanAssetState.includeObject,
//       onChanged: (p0) =>
//           bloc.switchIncludeObject(), // remove selected storage & prop value,
//     );
//   }

//   List<Widget> buildChildren(final bool p0) {
//     if (p0) {
//       const children = [
//         CreateAssetChooseObject(),
//         CreateAssetChoosePropValue(),
//         CreateAssetMaxSupply(),
//       ];
//       return children;
//     } else {
//       return [];
//     }
//   }
// }
