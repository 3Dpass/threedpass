import 'package:flutter/widgets.dart';
import 'package:threedpass/core/widgets/d3p_scaffold.dart';
import 'package:threedpass/core/widgets/other/padding_16.dart';
import 'package:threedpass/features/poscan_assets/create_assset/widgets/create_asset_choose_account.dart';
import 'package:threedpass/features/poscan_assets/create_assset/widgets/create_asset_choose_object.dart';
import 'package:threedpass/features/poscan_assets/create_assset/widgets/create_asset_input_id.dart';
import 'package:threedpass/features/poscan_assets/create_assset/widgets/create_asset_max_supply.dart';
import 'package:threedpass/features/poscan_assets/create_assset/widgets/create_asset_min_balance.dart';

class CreateAssetPage extends StatelessWidget {
  const CreateAssetPage({super.key});

  @override
  Widget build(final BuildContext context) {
    return D3pScaffold(
      appbarTitle: 'create_asset_page_title',
      body: Padding16(
        child: ListView(
          children: const [
            CreateAssetInputId(),
            CreateAssetChooseAccount(),
            CreateAssetMinBalance(),
            CreateAssetChooseObject(),
            CreateAssetMaxSupply(),
          ],
        ),
      ),
    );
  }
}
