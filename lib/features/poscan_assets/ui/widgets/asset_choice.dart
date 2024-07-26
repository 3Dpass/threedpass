import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/widgets/buttons/dropdown_button.dart';
import 'package:threedpass/features/poscan_assets/bloc/poscan_assets_cubit.dart';
import 'package:threedpass/features/poscan_assets/domain/entities/poscan_asset_metadata.dart';
import 'package:threedpass/features/poscan_assets/ui/widgets/dropdown_metadata_item.dart';

// TODO remove if no usage
class AssetChoice extends StatefulWidget {
  const AssetChoice({
    required this.onChanged,
    required this.addValidator,
    super.key,
  });

  final void Function(PoscanAssetMetadata?) onChanged;
  final bool addValidator;

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<AssetChoice> {
  late final List<DropdownMenuItem<PoscanAssetMetadata>> items;
  late PoscanAssetMetadata value;

  @override
  void initState() {
    final assets = BlocProvider.of<PoscanAssetsCubit>(context).state;
    items = assets.metadata.entries
        .map(
          (final e) => DropdownMenuItem<PoscanAssetMetadata>(
            value: e.value,
            child: DropdownMetadataItem(value: e.value),
          ),
        )
        .toList();

    value = assets.metadata.entries.first.value;

    super.initState();
  }

  @override
  Widget build(final BuildContext context) {
    return D3pDropdownButton(
      context: context,
      items: items,
      onChanged: widget.onChanged,
      value: value,
      validator: widget.addValidator
          ? (final p0) {
              if (p0 != null) {
                return 'asset_choice_validator_error'.tr();
              } else {
                return null;
              }
            }
          : null,
    );
  }
}
