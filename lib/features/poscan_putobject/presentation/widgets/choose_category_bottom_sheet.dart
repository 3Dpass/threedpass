import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/theme/d3p_special_styles.dart';
import 'package:threedpass/core/widgets/buttons/enum_button.dart';
import 'package:threedpass/core/widgets/other/padding_16.dart';
import 'package:threedpass/core/widgets/paddings.dart';
import 'package:threedpass/features/poscan_putobject/bloc/poscan_putobject_cubit.dart';
import 'package:threedpass/features/poscan_putobject/domain/entities/poscan_categories.dart';
import 'package:threedpass/features/poscan_putobject/utils/capitalize_first.dart';

@RoutePage(name: 'ChooseCategoryBottomSheetRoute')
class ChooseCategoryBottomSheet extends StatelessWidget {
  const ChooseCategoryBottomSheet({super.key});

  @override
  Widget build(final BuildContext context) {
    final textStyles = Theme.of(context).customTextStyles;
    return BlocBuilder<PoscanPutObjectCubit, D3PRPCCubitState>(
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
              const H24(),
              Padding16(
                child: Text(
                  cat.catName.capitalizeFirst(),
                  style: textStyles.secondaryText,
                ),
              ),
              cat.subCats.isEmpty
                  ? const H16()
                  : ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: cat.subCats.length,
                      itemBuilder: (final context, final index) => EnumButton(
                        text: cat.subCats[index].capitalizeFirst(),
                        onPressed: () =>
                            BlocProvider.of<PoscanPutObjectCubit>(context)
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
    );
  }
}
