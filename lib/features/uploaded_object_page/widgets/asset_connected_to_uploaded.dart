import 'package:flutter/material.dart';
import 'package:threedpass/features/other/link_to_page/entities/link_to_page_params.dart';
import 'package:threedpass/features/other/link_to_page/entities/link_to_poscan_asset_page_params.dart';
import 'package:threedpass/features/poscan_assets/domain/entities/poscan_token_data.dart';
import 'package:threedpass/features/other/link_to_page/ui/basic_links_list.dart';

class AssetsConnectedToUploaded extends StatelessWidget {
  final Iterable<PoscanAssetData> assets;

  const AssetsConnectedToUploaded({required this.assets, super.key});

  @override
  Widget build(final BuildContext context) {
    return BasicLinksList(
      items: assets
          .map<LinkToPageParams>((final data) =>
              LinkToPoscanAssetPageParams(asset: data, context: context))
          .toList(),
    );
  }
}
