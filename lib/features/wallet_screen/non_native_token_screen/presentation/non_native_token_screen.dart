import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:threedpass/core/polkawallet/utils/balance_utils.dart';
import 'package:threedpass/core/theme/d3p_special_styles.dart';
import 'package:threedpass/core/widgets/d3p_scaffold.dart';
import 'package:threedpass/core/widgets/other/copy_span_widget.dart';
import 'package:threedpass/core/widgets/other/fast_rich_text.dart';
import 'package:threedpass/core/widgets/other/padding_16.dart';
import 'package:threedpass/core/widgets/paddings.dart';
import 'package:threedpass/core/widgets/text/d3p_body_large_text.dart';
import 'package:threedpass/core/widgets/text/d3p_body_medium_text.dart';
import 'package:threedpass/core/widgets/text/d3p_title_large_text.dart';
import 'package:threedpass/features/poscan_assets/domain/entities/poscan_asset_combined.dart';
import 'package:threedpass/features/poscan_assets/domain/entities/poscan_asset_metadata.dart';
import 'package:threedpass/features/poscan_assets/domain/entities/poscan_token_data.dart';
import 'package:threedpass/features/preview_page/presentation/widgets/copy_text_card.dart';
import 'package:threedpass/features/wallet_screen/non_native_token_screen/bloc/assets_get_extrisincs_cubit.dart';
import 'package:threedpass/features/wallet_screen/non_native_token_screen/domain/entities/asset_history_create.dart';
import 'package:threedpass/features/wallet_screen/non_native_token_screen/domain/entities/asset_history_mint.dart';
import 'package:threedpass/features/wallet_screen/non_native_token_screen/domain/entities/asset_history_set_meta_data.dart';
import 'package:threedpass/features/wallet_screen/non_native_token_screen/domain/entities/asset_history_transfer.dart';
import 'package:threedpass/features/wallet_screen/non_native_token_screen/domain/entities/asset_history_unknown.dart';
import 'package:threedpass/features/wallet_screen/non_native_token_screen/domain/entities/transfer_non_native_token_atom.dart';
import 'package:threedpass/features/wallet_screen/non_native_token_screen/presentation/widgets/asset_transfer_button.dart';
import 'package:threedpass/features/wallet_screen/non_native_token_screen/presentation/widgets/poscan_asset_balance_section.dart';
import 'package:threedpass/features/wallet_screen/non_native_token_screen/presentation/widgets/poscan_asset_data_section.dart';
import 'package:threedpass/features/wallet_screen/non_native_token_screen/presentation/widgets/poscan_asset_metadata_section.dart';
import 'package:threedpass/features/wallet_screen/non_native_token_screen/presentation/widgets/poscan_asset_mint_section.dart';
import 'package:threedpass/features/wallet_screen/non_native_token_screen/presentation/widgets/poscan_asset_transfer_floating_button.dart';
import 'package:threedpass/features/wallet_screen/widgets/asset_balance_text.dart';
import 'package:threedpass/features/wallet_screen/widgets/block_datetime_w.dart';
import 'package:threedpass/features/wallet_screen/widgets/extrinsic_status_icon.dart';
import 'package:threedpass/features/wallet_screen/widgets/short_address.dart';
import 'package:threedpass/features/wallet_screen/widgets/transaction_item.dart';

// part 'widgets/assets_history_paged_list.dart';
part './widgets/no_history_found.dart';
part './widgets/asset_history_create_widget.dart';
// part './widgets/asset_history_mint_widget.dart';
// part './widgets/asset_history_set_metadata_widget.dart';
part './widgets/asset_history_unknown_widget.dart';
// part './widgets/asset_history_list_item.dart';

class NonNativeTokenScreen extends StatelessWidget {
  const NonNativeTokenScreen({
    required this.poscanAssetCombined,
    super.key,
  });

  final PoscanAssetCombined poscanAssetCombined;

  String appbarTitle() {
    if (poscanAssetCombined.poscanAssetMetadata == null) {
      return poscanAssetCombined.poscanAssetData.id.toString();
      // return 'non_native_token_token'
      //     .tr(args: [poscanAssetCombined.poscanAssetData.id.toString()]);
    } else {
      return poscanAssetCombined.poscanAssetMetadata!.name;
      // return 'non_native_token_token'
      //     .tr(args: []);
    }
  }

  @override
  Widget build(final BuildContext context) {
    // final tkb = BlocProvider.of<AssetsGetExtrinsicsCubit>(context)
    //     .getExtrinsics
    //     .paramsUseCase
    //     .tokenBalanceData;
    final metadata = poscanAssetCombined.poscanAssetMetadata;
    // final symbol = metadata?.symbol ?? '';

    final children = [
      PoscanAssetDataSection(
        poscanAssetData: poscanAssetCombined.poscanAssetData,
      ),
      PoscanAssetMetadataSection(
        poscanAssetData: poscanAssetCombined.poscanAssetData,
        metadata: metadata,
      ),
    ];

    if (metadata != null) {
      children.add(
        PoscanAssetMintSection(
          poscanAssetData: poscanAssetCombined.poscanAssetData,
        ),
      );
    }

    if (metadata != null) {
      children.insert(
        0,
        PoscanAssetBalanceSection(
          poscanAssetBalance: poscanAssetCombined.poscanAssetBalance,
          metadata: metadata,
        ),
      );
    }

    return D3pScaffold(
      appbarTitle: appbarTitle(),
      translateAppbar: false,
      floatingActionButton: PoscanAssetTransferFloatingButton(
        enabled: poscanAssetCombined.poscanAssetBalance != null,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        itemCount: children.length,
        itemBuilder: (final context, final index) => children[index],
        separatorBuilder: (final context, final index) => const Divider(),
        // children: [
        //   // Mint section
        //   // Transfer section
        //   // History section
        //   // const SizedBoxH24(),
        //   // const Padding(
        //   //   padding: EdgeInsets.symmetric(horizontal: 16),
        //   //   child: AssetTransferButton(),
        //   // ),
        //   // const SizedBoxH36(),
        //   // const Padding(
        //   //   padding: EdgeInsets.symmetric(horizontal: 16),
        //   //   child: D3pTitleLargeText('non_native_history_title_label'),
        //   // ),
        //   // const SizedBoxH8(),
        //   // Flexible(
        //   //   child: _AssetsHistoryPagetList(),
        //   // ),
        // ],
      ),
    );
  }
}
