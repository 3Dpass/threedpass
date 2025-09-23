import 'package:flutter/material.dart';
import 'package:number_text_input_formatter/number_text_input_formatter.dart';
import 'package:threedpass/core/widgets/d3p_card.dart';
import 'package:threedpass/core/widgets/paddings.dart';
import 'package:threedpass/features/asset_conversion/domain/entities/basic_pool_entity.dart';
import 'package:threedpass/features/asset_conversion/ui/swap/presentation/widgets/asset_picker.dart';

class AssetSelectCard extends StatelessWidget {
  final List<PoolAssetField> items;
  // final int initialSelectionIndex;
  final TextEditingController controller;
  final bool isReadOnly;
  final PoolAssetField? chosenItem;
  final void Function(PoolAssetField) onSelected;

  const AssetSelectCard({
    required this.items,
    required this.controller,
    required this.isReadOnly,
    required this.onSelected,
    required this.chosenItem,
    super.key,
  });

  @override
  Widget build(final BuildContext context) {
    final theme = Theme.of(context);
    return D3pCard(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Row(
          children: [
            AssetPicker(
              key: ValueKey(chosenItem),
              initialValue: chosenItem,
              onSelected: onSelected,
              assetItems: items,
            ),
            const W16(),
            Flexible(
              child: TextFormField(
                controller: controller,
                // autofocus: !isReadOnly,
                readOnly: isReadOnly,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                ),
                textAlign: TextAlign.right,
                keyboardType: TextInputType.number,
                style: theme.textTheme.headlineSmall!.copyWith(
                  color: isReadOnly
                      ? theme.disabledColor
                      : theme.textTheme.bodyMedium!.color,
                ),
                inputFormatters: [
                  NumberTextInputFormatter(
                    // integerDigits: 10,
                    // decimalDigits: 2,
                    // maxValue: '1000000000.00',
                    decimalSeparator: '.',
                    groupDigits: 3,
                    groupSeparator: ',',
                    allowNegative: false,
                    overrideDecimalPoint: false,
                    insertDecimalPoint: false,
                    insertDecimalDigits: false,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
