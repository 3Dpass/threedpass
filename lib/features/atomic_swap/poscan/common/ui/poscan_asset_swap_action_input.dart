import 'package:flutter/material.dart';
import 'package:threedpass/core/utils/validators.dart';
import 'package:threedpass/core/widgets/input/textformfield/textformfield.dart';
import 'package:threedpass/features/asset_conversion/domain/entities/basic_pool_entity.dart';
import 'package:threedpass/features/asset_conversion/ui/swap/presentation/widgets/asset_picker.dart';
import 'package:threedpass/features/common/form_option/form_field_card.dart';

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
    return FormFieldCard(
        fieldName: 'Asset to swap', // TODO Localize
        child: Column(
          spacing: 16,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
        ));
  }
}
