import 'package:flutter/material.dart';
import 'package:threedpass/features/asset_conversion/domain/entities/basic_pool_entity.dart';
import 'package:threedpass/features/poscan_assets/ui/widgets/dropdown_asset_item.dart';

// https://github.com/flutter/flutter/issues/108683#issuecomment-2002177122
class AssetChoiceChip extends StatelessWidget {
  const AssetChoiceChip({
    required this.menuItemList,
    // required this.initialSelectionIndex,
    required this.chosenItem,
    this.onSelected,
    super.key,
  });

  final List<(PoolAssetField, Widget)> menuItemList;
  final PoolAssetField chosenItem;
  final void Function(PoolAssetField)? onSelected;

  static const double menuButtonHeight = 48;

  void onChipPressed(final MenuController controller) {
    if (controller.isOpen) {
      controller.close();
    } else {
      controller.open();
    }
  }

  void onMenuItemPressed(final PoolAssetField rec) {
    onSelected?.call(rec);
  }

  @override
  Widget build(final BuildContext context) {
    return MenuAnchor(
      style: MenuStyle(
        backgroundColor: WidgetStateProperty.all(
          Theme.of(context).scaffoldBackgroundColor,
        ),
        maximumSize: WidgetStateProperty.all(
          const Size.fromHeight(menuButtonHeight * 5),
        ),
      ),
      builder: (final context, final controller, final child) {
        return FilterChip(
          elevation: 1,
          showCheckmark: false,
          // backgroundColor: Colors.green,
          label: DropdownAssetItem(
            value: chosenItem,
            // prefixColor: Colors.white,
            // mainColor: Colors.white,
          ),
          // selected: true,
          onSelected: (final _) => onChipPressed(controller),
        );
      },
      menuChildren: [
        for (final rec in menuItemList)
          SizedBox(
            height: menuButtonHeight,
            child: MenuItemButton(
              child: DropdownAssetItem(
                value: rec.$1,
              ),
              onPressed: () => onMenuItemPressed(rec.$1),
            ),
          ),
      ],
    );
  }
}
