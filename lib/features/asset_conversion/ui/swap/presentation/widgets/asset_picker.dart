import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:threedpass/core/widgets/buttons/secondary_button.dart';
import 'package:threedpass/core/widgets/other/form_field_error_text.dart';
import 'package:threedpass/features/asset_conversion/domain/entities/basic_pool_entity.dart';
import 'package:threedpass/features/poscan_assets/ui/widgets/dropdown_asset_item.dart';

// TODO Move file to common widgets
class AssetPicker extends FormField<PoolAssetField?> {
  AssetPicker({
    required final Iterable<PoolAssetField> assetItems,
    required final void Function(PoolAssetField) onSelected,
    final PoolAssetField? initialValue,
    final String? Function(PoolAssetField?)? validator = _isNotEmpty,
    super.key,
  }) : super(
          initialValue: initialValue,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: validator,
          builder: (final FormFieldState<PoolAssetField?> state) {
            final theme = Theme.of(state.context);

            return MenuAnchor(
              style: MenuStyle(
                backgroundColor: WidgetStateProperty.all(
                  theme.scaffoldBackgroundColor,
                ),
                maximumSize: WidgetStateProperty.all(
                  const Size.fromHeight(menuButtonHeight * 5),
                ),
              ),
              builder: (final context, final controller, final child) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    D3pSecondaryButton(
                      isInfinityWidth: false,
                      color: state.hasError ? theme.colorScheme.error : null,
                      customChild: state.value != null
                          ? DropdownAssetItem(
                              value: state.value!,
                            )
                          : Text('asset_picker_placeholder'.tr()),
                      onPressed: () => onChipPressed(controller),
                    ),
                    FormFieldErrorText(state, pt: 4, pl: 8),
                  ],
                );
              },
              menuChildren: [
                for (final rec in assetItems)
                  SizedBox(
                    height: menuButtonHeight,
                    child: MenuItemButton(
                      child: DropdownAssetItem(
                        value: rec,
                      ),
                      onPressed: () => onAssetItemPressed(
                        asset: rec,
                        onSelected: onSelected,
                        state: state,
                      ),
                    ),
                  ),
              ],
            );
          },
        );

  static const double menuButtonHeight = 48;

  static void onAssetItemPressed({
    required final PoolAssetField asset,
    required final void Function(PoolAssetField) onSelected,
    required final FormFieldState<PoolAssetField?> state,
  }) {
    state.didChange(asset);
    onSelected(asset);
  }

  static void onChipPressed(final MenuController controller) {
    if (controller.isOpen) {
      controller.close();
    } else {
      controller.open();
    }
  }
}

String? _isNotEmpty(final PoolAssetField? p) {
  return p == null ? 'require_form_field'.tr() : null;
}
