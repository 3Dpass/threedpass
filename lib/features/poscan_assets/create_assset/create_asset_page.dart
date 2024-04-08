import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/features/other/some_form/some_form.dart';
import 'package:threedpass/features/poscan_assets/create_assset/bloc/create_poscan_asset_cubit.dart';
import 'package:threedpass/features/poscan_assets/create_assset/widgets/create_asset_choose_account.dart';
import 'package:threedpass/features/poscan_assets/create_assset/widgets/create_asset_choose_object.dart';
import 'package:threedpass/features/poscan_assets/create_assset/widgets/create_asset_choose_prop_value.dart';
import 'package:threedpass/features/poscan_assets/create_assset/widgets/create_asset_input_id.dart';
import 'package:threedpass/features/poscan_assets/create_assset/widgets/create_asset_max_supply.dart';
import 'package:threedpass/features/poscan_assets/create_assset/widgets/create_asset_min_balance.dart';
import 'package:threedpass/features/poscan_assets/create_assset/widgets/create_asset_submit.dart';

@RoutePage()
class CreateAssetPage extends StatelessWidget {
  const CreateAssetPage({super.key});

  @override
  Widget build(final BuildContext context) {
    return SomeForm(
      formKey: BlocProvider.of<CreatePoscanAssetCubit>(context).formKey,
      appbarTitle: 'create_asset_page_title',
      children: const [
        CreateAssetInputId(),
        CreateAssetChooseAccount(),
        CreateAssetMinBalance(),
        CreateAssetChooseObject(),
        CreateAssetChoosePropValue(),
        CreateAssetMaxSupply(),
        Padding(
          padding: EdgeInsets.only(top: 20),
          child: CreateAssetSubmit(),
        ),
      ],
    );
  }
}
