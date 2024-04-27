import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/widgets/buttons/dropdown_button.dart';
import 'package:threedpass/features/other/choose_asset_id/poscan_token_data_dropdown_menu_item.dart';
import 'package:threedpass/features/poscan_assets/bloc/poscan_assets_cubit.dart';
import 'package:threedpass/features/poscan_assets/data/poscan_assets_repository.dart';
import 'package:threedpass/features/poscan_assets/domain/entities/poscan_token_data.dart';
import 'package:threedpass/setup.dart';

class ChooseAssetId extends StatefulWidget {
  const ChooseAssetId({
    required this.initialAsset,
    required this.onChoose,
    super.key,
  });

  final int initialAsset;
  final void Function(PoscanAssetData)? onChoose;

  @override
  State<StatefulWidget> createState() => ChooseAssetIdState();
}

class ChooseAssetIdState extends State<ChooseAssetId> {
  final List<PoscanAssetData> assets = [];
  late PoscanAssetData chosenAsset;
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
    final filtered = loadedAssets
        .where((final element) => element.poscanAssetMetadata == null)
        .map((final e) => e.poscanAssetData)
        .toList();
    // final tokensResp = await repository.allTokens();
    // tokensResp.when(
    //   left: (final e) {
    //     setState(() {
    //       error = e.cause.toString();
    //       isLoading = false;
    //     });
    //   },
    //   right: (final tokens) {
    setState(() {
      assets.clear();
      assets.addAll(filtered);

      chosenAsset = assets
          .firstWhere((final element) => element.id == widget.initialAsset);

      isLoading = false;
    });
    //   },
    // );
  }

  void onChanged(final PoscanAssetData? newData) {
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
          (final e) => DropdownMenuItem<PoscanAssetData>(
            value: e,
            child: PoscanTokenDataDropdownMenuItem(e),
          ),
        )
        .toList();
    return D3pDropdownButton<PoscanAssetData>(
      context: context,
      items: items,
      onChanged: widget.onChoose == null ? null : onChanged,
      value: chosenAsset,
    );
  }
}
