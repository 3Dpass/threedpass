import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/theme/d3p_special_styles.dart';
import 'package:threedpass/core/widgets/buttons/enum_button.dart';
import 'package:threedpass/core/widgets/other/padding_16.dart';
import 'package:threedpass/core/widgets/paddings.dart';
import 'package:threedpass/core/widgets/text/d3p_body_medium_text.dart';
import 'package:threedpass/features/poscan_putobject/bloc/d3prpc_cubit.dart';
import 'package:threedpass/features/poscan_putobject/domain/entities/poscan_categories.dart';
import 'package:threedpass/features/poscan_putobject/presentation/d3prpc_widgets/open_bottom_sheet.dart';
import 'package:threedpass/features/poscan_putobject/utils/capitalize_first.dart';

class ChooseCategory extends StatelessWidget {
  const ChooseCategory({super.key});

  @override
  Widget build(final BuildContext context) {
    final textStyles = Theme.of(context).customTextStyles;

    return OpenBottomSheet(
      unlocalizedSubtitle: 'poscan_putobject_choose_category',
      buttonIconData: Icons.check_box_outline_blank_outlined,
      buttonTextChild: BlocBuilder<D3PRPCCubit, D3PRPCCubitState>(
        buildWhen: (final previous, final current) =>
            previous.chosenCategory != current.chosenCategory,
        builder: (final context, final state) => D3pBodyMediumText(
          '${state.chosenCategory.cat.capitalizeFirst()} -> ${state.chosenCategory.subCat.capitalizeFirst()}',
          translate: false,
        ),
      ),
      bottomSheetPlatform: BlocBuilder<D3PRPCCubit, D3PRPCCubitState>(
        buildWhen: (final previous, final current) =>
            previous.chosenCategory != current.chosenCategory,
        builder: (final context, final state) => ListView.builder(
          shrinkWrap: true,
          itemCount: PoscanCategories.allCats.length,
          itemBuilder: (final context, final index) {
            final cat = PoscanCategories.allCats[index];
            return Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding16(
                  child: Text(
                    cat.catName.capitalizeFirst(),
                    style: textStyles.secondaryText,
                  ),
                ),
                cat.subCats.isEmpty
                    ? const SizedBoxH16()
                    : ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: cat.subCats.length,
                        itemBuilder: (final context, final index) => EnumButton(
                          text: cat.subCats[index].capitalizeFirst(),
                          onPressed: () => BlocProvider.of<D3PRPCCubit>(context)
                              .changeCategory(
                            MapPoscanCategory(
                              cat: cat.catName,
                              subCat: cat.subCats[index],
                            ),
                          ),
                          isChosen: state.chosenCategory.cat == cat.catName &&
                              state.chosenCategory.subCat == cat.subCats[index],
                        ),
                      ),
              ],
            );
          },
        ),
      ),
    );
  }
}
