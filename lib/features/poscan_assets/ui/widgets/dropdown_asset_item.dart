import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/theme/d3p_special_styles.dart';
import 'package:threedpass/features/asset_conversion/domain/entities/basic_pool_entity.dart';
import 'package:threedpass/features/poscan_assets/bloc/poscan_assets_cubit.dart';
import 'package:threedpass/features/poscan_assets/ui/widgets/dropdown_metadata_item.dart';

class DropdownAssetItem extends StatelessWidget {
  const DropdownAssetItem({
    required this.value,
    super.key,
  });

  final PoolAssetField value;

  @override
  Widget build(final BuildContext context) {
    if (value.isNative) {
      return Text(
        'Native P3D',
        style: Theme.of(context).customTextStyles.d3pBodyMedium,
      );
    }
    final metadataAll =
        BlocProvider.of<PoscanAssetsCubit>(context).state.metadata;
    final metadata = metadataAll[value.assetId]!;
    return DropdownMetadataItem(value: metadata);
  }
}
