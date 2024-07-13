import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/features/other/some_form/some_form.dart';
import 'package:threedpass/features/poscan_assets/ui/create_assset/bloc/create_poscan_asset_cubit.dart';
import 'package:threedpass/features/poscan_assets/ui/create_assset/presentation/widgets/create_asset_choose_account.dart';
import 'package:threedpass/features/poscan_assets/ui/create_assset/presentation/widgets/create_asset_input_id.dart';
import 'package:threedpass/features/poscan_assets/ui/create_assset/presentation/widgets/create_asset_min_balance.dart';
import 'package:threedpass/features/poscan_assets/ui/create_assset/presentation/widgets/create_asset_object_option.dart';
import 'package:threedpass/features/poscan_assets/ui/create_assset/presentation/widgets/create_asset_submit.dart';

@RoutePage()
class CreateAssetPage extends StatelessWidget {
  const CreateAssetPage({super.key});

  @override
  Widget build(final BuildContext context) {
    return SomeForm(
      formKey: BlocProvider.of<CreatePoscanAssetCubit>(context).formKey,
      appbarTitle: 'create_asset_page_title',
      submitButton: const CreateAssetSubmit(),
      children: const [
        CreateAssetInputId(),
        CreateAssetChooseAccount(),
        CreateAssetMinBalance(),
        CreateAssetObjectOption(),
      ],
    );
  }
}
