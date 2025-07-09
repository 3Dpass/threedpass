import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/widgets/d3p_card.dart';
import 'package:threedpass/core/widgets/input/textformfield/textformfield.dart';
import 'package:threedpass/core/widgets/paddings.dart';
import 'package:threedpass/features/asset_conversion/domain/entities/basic_pool_entity.dart';
import 'package:threedpass/features/poscan_assets/bloc/poscan_assets_cubit.dart';
import 'package:threedpass/features/asset_conversion/ui/swap/presentation/widgets/asset_choice_chip.dart';
import 'package:threedpass/features/poscan_assets/ui/widgets/dropdown_asset_item.dart';

class PoscanAssetSwapActionInput extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<PoolAssetField> onSelected;
  final PoolAssetField? chosenItem;

  const PoscanAssetSwapActionInput({
    required this.controller,
    required this.onSelected,
    required this.chosenItem,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final pacBloc = BlocProvider.of<PoscanAssetsCubit>(context);
    final assetItems = pacBloc.allAssets;
    // final theme = Theme.of(context);
    return D3pCard(
      cardShape: CardShape.all,
      child: SizedBox(
        // width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Poscan asset swap action'),
              H16(),
              Row(
                children: [
                  SizedBox(
                    width: 100,
                    child: Text('asset:'),
                  ),
                  AssetChoiceChip(
                    chosenItem: chosenItem,
                    onSelected: onSelected,
                    menuItemList: assetItems
                        .map<(PoolAssetField, Widget)>(
                          (e) => (
                            e,
                            DropdownAssetItem(value: e),
                          ),
                        )
                        .toList(),
                  ),
                ],
              ),
              H16(),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: 100,
                    child: Text('amount:'),
                  ),
                  Flexible(
                    child: SizedBox(
                      height: 48,
                      child: D3pTextFormField(
                        controller: controller,

                        keyboardType: TextInputType.number,
                        // style: theme.textTheme.bodyLarge,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
