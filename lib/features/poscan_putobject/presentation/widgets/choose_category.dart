import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/widgets/text/d3p_body_medium_text.dart';
import 'package:threedpass/features/poscan_putobject/bloc/poscan_putobject_cubit.dart';
import 'package:threedpass/features/poscan_putobject/presentation/widgets/open_bottom_sheet.dart';
import 'package:threedpass/features/poscan_putobject/utils/capitalize_first.dart';
import 'package:threedpass/router/router.gr.dart';

class ChooseCategory extends StatelessWidget {
  const ChooseCategory({super.key});

  @override
  Widget build(final BuildContext context) {
    return OpenBottomSheet(
      unlocalizedSubtitle: 'poscan_putobject_choose_category',
      buttonIconData: Icons.check_box_outline_blank_outlined,
      buttonTextChild: BlocBuilder<PoscanPutObjectCubit, D3PRPCCubitState>(
        buildWhen: (final previous, final current) =>
            previous.chosenCategory != current.chosenCategory,
        builder: (final context, final state) => D3pBodyMediumText(
          '${state.chosenCategory.cat.capitalizeFirst()} -> ${state.chosenCategory.subCat.capitalizeFirst()}',
          translate: false,
        ),
      ),
      openBottomSheet: () async => context.router.push(
        const ChooseCategoryBottomSheetRoute(),
      ),
    );
  }
}
