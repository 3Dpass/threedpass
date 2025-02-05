import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/polkawallet/app_service.dart';
import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';
import 'package:threedpass/core/widgets/paddings.dart';
import 'package:threedpass/features/wallet_screen/assets_page/widgets/asset_page_appbar.dart';
import 'package:threedpass/features/wallet_screen/assets_page/widgets/balance_section.dart';
import 'package:threedpass/features/wallet_screen/assets_page/widgets/buttons_panel.dart';
import 'package:threedpass/features/wallet_screen/assets_page/widgets/non_native_tokens/poscan_assets_column.dart';
import 'package:threedpass/features/wallet_screen/assets_page/widgets/objects_list/objects_list_assets.dart';

class AssetsPage extends StatelessWidget {
  const AssetsPage({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    return BlocBuilder<AppServiceLoaderCubit, AppService>(
      builder: (final context, final state) {
        // final theme = Theme.of(context);
        const children = [
          BalanceSection(),
          // const H8(),
          AssetPageButtonsPanel(),
          PoscanAssetsColumn(),
          ObjectsListAssets(),
        ];

        return Scaffold(
          // TODO Refactor to D3pScaffold
          appBar: AssetPageAppbar(
            account: state.keyring.current,
          ),
          body: ListView.separated(
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(vertical: 16),
            itemBuilder: (final context, final index) => children[index],
            separatorBuilder: (final context, final index) => const H16(),
            itemCount: children.length,
          ),
        );
      },
    );
  }
}
