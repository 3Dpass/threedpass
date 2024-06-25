import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/widgets/buttons/dropdown_button.dart';
import 'package:threedpass/features/asset_conversion/domain/entities/basic_pool_entity.dart';
import 'package:threedpass/features/poscan_assets/bloc/poscan_assets_cubit.dart';
import 'package:threedpass/features/poscan_assets/domain/entities/poscan_asset_metadata.dart';
import 'package:threedpass/features/poscan_assets/ui/widgets/dropdown_asset_child.dart';

class CreatePoolAssetChoice extends StatefulWidget {
  final void Function(PoolAssetField?) onChanged;

  const CreatePoolAssetChoice({
    required this.onChanged,
    super.key,
  });

  static const initialPoscanAssetField =
      PoolAssetField(isNative: true, assetId: null);

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<CreatePoolAssetChoice> {
  PoolAssetField? value;

  late final List<PoolAssetField> items;
  late final Map<int, PoscanAssetMetadata> metadata;

  @override
  void initState() {
    metadata = BlocProvider.of<PoscanAssetsCubit>(context).state.metadata;
    items = <PoolAssetField>[
      CreatePoolAssetChoice.initialPoscanAssetField,
      ...metadata.keys
          .map((final e) => PoolAssetField(assetId: e, isNative: false)),
    ];
    value = items.first;

    super.initState();
  }

  @override
  Widget build(final BuildContext context) {
    return D3pDropdownButton<PoolAssetField>(
      context: context,
      items: items
          .map(
            (final e) => DropdownMenuItem<PoolAssetField>(
              value: e,
              child: e.isNative
                  ? Text('Native P3D')
                  : DropdownAssetChild(value: metadata[e.assetId]!),
            ),
          )
          .toList(),
      onChanged: onChange,
      value: value,
      validator: poolAssetValidator,
    );
  }

  String? poolAssetValidator(final PoolAssetField? p0) {
    if (p0 == null) {
      return 'asset_choice_validator_error'.tr();
    } else {
      return null;
    }
  }

  void onChange(final PoolAssetField? p0) {
    setState(() {
      value = p0;
      widget.onChanged(p0);
    });
  }
}
