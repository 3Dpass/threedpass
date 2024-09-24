import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/widgets/other/fast_rich_text.dart';
import 'package:threedpass/features/asset_conversion/domain/entities/basic_pool_entity.dart';
import 'package:threedpass/features/poscan_assets/bloc/poscan_assets_cubit.dart';
import 'package:threedpass/features/poscan_assets/ui/widgets/dropdown_metadata_item.dart';

class DropdownAssetItem extends StatelessWidget {
  const DropdownAssetItem({
    required this.value,
    this.prefixColor,
    this.mainColor,
    super.key,
  });

  final PoolAssetField value;
  final Color? prefixColor;
  final Color? mainColor;

  @override
  Widget build(final BuildContext context) {
    if (value.isNative) {
      final medium = Theme.of(context).textTheme.bodyMedium;
      return Text(
        'Native P3D',
        style: mainColor != null ? medium!.copyWith(color: mainColor) : medium,
      );
    }
    final metadata = BlocProvider.of<PoscanAssetsCubit>(context)
        .state
        .metadata[value.assetId];
    if (metadata != null) {
      return DropdownMetadataItem(
        value: metadata,
        prefixColor: prefixColor,
        mainColor: mainColor,
      );
    } else {
      return FastRichText(
        mainText: value.assetId.toString(),
        secondaryText: 'id:',
        needSpace: true,
        secondaryTextColor: prefixColor,
        mainTextColor: mainColor,
      );
    }
  }
}
