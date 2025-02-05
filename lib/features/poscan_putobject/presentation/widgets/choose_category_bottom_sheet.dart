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
      builder: (final context, final state) => ListView.builder(
        shrinkWrap: true,
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
                  : _CatsList(state: state, cat: cat),
            ],
          );
        },
        itemCount: PoscanCategories.allCats.length,
      ),
      buildWhen: (final previous, final current) =>
          previous.chosenCategory != current.chosenCategory,
    );
  }
}

class _CatsList extends StatelessWidget {
  final D3PRPCCubitState state;
  final PoscanCategories cat;

  const _CatsList({
    required this.state,
    required this.cat,
  });

  @override
  Widget build(final BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        cat.subCats.length,
        (final index) => EnumButton(
          text: cat.subCats[index].capitalizeFirst(),
          isChosen: state.chosenCategory.cat == cat.catName &&
              state.chosenCategory.subCat == cat.subCats[index],
          onPressed: () =>
              BlocProvider.of<PoscanPutObjectCubit>(context).changeCategory(
            MapPoscanCategory(
              cat: cat.catName,
              subCat: cat.subCats[index],
            ),
          ),
        ),
      ),
    );
  }
}
