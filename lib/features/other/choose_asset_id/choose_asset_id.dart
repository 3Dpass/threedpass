import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/widgets/buttons/dropdown_button.dart';
import 'package:threedpass/core/widgets/text/d3p_body_medium_text.dart';
import 'package:threedpass/features/other/choose_asset_id/poscan_token_data_dropdown_menu_item.dart';
import 'package:threedpass/features/poscan_assets/bloc/poscan_assets_cubit.dart';
import 'package:threedpass/features/poscan_assets/data/poscan_assets_repository.dart';
import 'package:threedpass/features/poscan_assets/domain/entities/poscan_asset_combined.dart';
import 'package:threedpass/setup.dart';

class ChooseAssetId extends StatefulWidget {
  const ChooseAssetId({
    required this.initialAsset,
    required this.onChoose,
    super.key,
  });

  final int initialAsset;
  final void Function(PoscanAssetCombined)? onChoose;

  @override
  State<StatefulWidget> createState() => ChooseAssetIdState();
}

class ChooseAssetIdState extends State<ChooseAssetId> {
  final List<PoscanAssetCombined> assets = [];
  late PoscanAssetCombined chosenAsset;
  bool isLoading = true;

  final PoscanAssetsRepository repository = getIt<PoscanAssetsRepository>();

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    final loadedAssets =
        BlocProvider.of<PoscanAssetsCubit>(context).state.combined;

    setState(() {
      assets.clear();
      assets.addAll(loadedAssets);

      chosenAsset = loadedAssets.firstWhere(
        (final element) => element.poscanAssetData.id == widget.initialAsset,
      );

      isLoading = false;
    });
  }

  void onChanged(final PoscanAssetCombined? newData) {
    if (newData != null) {
      setState(() {
        chosenAsset = newData;
        widget.onChoose!(newData);
      });
    }
  }

  @override
  Widget build(final BuildContext context) {
    if (isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    final items = assets
        .map(
          (final e) => DropdownMenuItem<PoscanAssetCombined>(
            value: e,
            child: PoscanTokenDataDropdownMenuItem(
              data: e.poscanAssetData,
              metadata: e.poscanAssetMetadata,
            ),
          ),
        )
        .toList();
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const D3pBodyMediumText('asset_id_dropdown_label'),
        const SizedBox(height: 4),
        D3pDropdownButton<PoscanAssetCombined>(
          context: context,
          items: items,
          onChanged: widget.onChoose == null ? null : onChanged,
          value: chosenAsset,
        ),
      ],
    );
  }
}
