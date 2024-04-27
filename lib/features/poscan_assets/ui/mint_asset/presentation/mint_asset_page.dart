import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/features/other/some_form/some_form.dart';
import 'package:threedpass/features/poscan_assets/ui/mint_asset/bloc/mint_asset_cubit.dart';

@RoutePage()
class MintAssetPage extends StatelessWidget {
  const MintAssetPage({super.key});

  @override
  Widget build(final BuildContext context) {
    return SomeForm(
      formKey: BlocProvider.of<MintAssetCubit>(context).formKey,
      appbarTitle: 'create_asset_page_title',
      submitButton: SizedBox(),
      children: const [],
    );
  }
}
