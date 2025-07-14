import 'package:flutter/material.dart';
import 'package:threedpass/core/utils/validators.dart';
import 'package:threedpass/core/widgets/d3p_card.dart';
import 'package:threedpass/core/widgets/input/textformfield/textformfield.dart';
import 'package:threedpass/core/widgets/paddings.dart';
import 'package:threedpass/features/asset_conversion/domain/entities/basic_pool_entity.dart';
import 'package:threedpass/features/asset_conversion/ui/swap/presentation/widgets/asset_picker.dart';

class PoscanAssetSwapActionInput extends StatelessWidget {
  final List<PoolAssetField> assetItems;
  final TextEditingController controller;
  final ValueChanged<PoolAssetField> onSelected;
  final PoolAssetField? chosenItem;

  const PoscanAssetSwapActionInput({
    required this.assetItems,
    required this.controller,
    required this.onSelected,
    required this.chosenItem,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
              Text('Poscan asset swap action'), // TODO Localize
              H16(),
              Row(
                children: [
                  SizedBox(
                    width: 100,
                    child: Text('asset'), // TODO Localize
                  ),
                  AssetPicker(
                    onSelected: onSelected,
                    assetItems: assetItems,
                  ),
                ],
              ),
              H16(),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: 100,
                    child: Text('amount'), // TODO Localize
                  ),
                  Flexible(
                    child: D3pTextFormField(
                      controller: controller,
                      keyboardType: TextInputType.number,
                      validator: Validators.notEmpty,
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
