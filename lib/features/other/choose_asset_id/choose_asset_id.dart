import 'package:flutter/material.dart';
import 'package:threedpass/core/widgets/buttons/dropdown_button.dart';
import 'package:threedpass/core/widgets/text/d3p_body_medium_text.dart';
import 'package:threedpass/features/other/choose_asset_id/poscan_token_data_dropdown_menu_item.dart';
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

  String error = "";
  final PoscanAssetsRepository repository = getIt<PoscanAssetsRepository>();

  @override
  void initState() {
    super.initState();
  }

  Future<void> init() async {
    final tokensResp = await repository.allTokens();
    tokensResp.when(
      left: (final e) {
        setState(() {
          error = e.cause.toString();
          isLoading = false;
        });
      },
      right: (final tokens) {
        setState(() {
          assets.clear();
          assets.addAll(tokens);

          chosenAsset = assets
              .firstWhere((final element) => element.id == widget.initialAsset);

          isLoading = false;
        });
      },
    );
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
      return const CircularProgressIndicator();
    }

    if (error.isNotEmpty) {
      // TODO Check this
      return D3pBodyMediumText(
        error,
        translate: false,
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
