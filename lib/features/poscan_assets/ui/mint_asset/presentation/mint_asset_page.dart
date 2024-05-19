import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/features/other/some_form/some_form.dart';
import 'package:threedpass/features/poscan_assets/ui/mint_asset/bloc/mint_asset_cubit.dart';
import 'package:threedpass/features/poscan_assets/ui/mint_asset/presentation/widget/mint_amount_textfield.dart';
import 'package:threedpass/features/poscan_assets/ui/mint_asset/presentation/widget/mint_choose_account.dart';
import 'package:threedpass/features/poscan_assets/ui/mint_asset/presentation/widget/mint_choose_asset.dart';
import 'package:threedpass/features/poscan_assets/ui/mint_asset/presentation/widget/mint_submit_button.dart';

@RoutePage()
class MintAssetPage extends StatelessWidget {
  const MintAssetPage({super.key});

  @override
  Widget build(final BuildContext context) {
    return SomeForm(
      formKey: BlocProvider.of<MintAssetCubit>(context).formKey,
      appbarTitle: 'mint_asset_page_title',
      submitButton: const MintAssetSubmitButton(),
      children: const [
        MintChooseAccount(),
        MintChooseAsset(),
        MintAmountTextField(),
      ],
    );
  }
}
