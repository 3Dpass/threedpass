import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/features/asset_conversion/ui/create_pool/bloc/create_pool_cubit.dart';
import 'package:threedpass/features/asset_conversion/ui/widgets/stateful_pool_asset_choice.dart';
import 'package:threedpass/features/other/choose_account/presentation/choose_account.dart';
import 'package:threedpass/features/other/some_form/some_form.dart';
import 'package:threedpass/features/other/some_form/some_form_submit_button.dart';

class CreatePoolPage extends StatelessWidget {
  const CreatePoolPage({super.key});

  @override
  Widget build(final BuildContext context) {
    final cubit = BlocProvider.of<CreatePoolCubit>(context);

    return SomeForm(
      formKey: BlocProvider.of<CreatePoolCubit>(context).formKey,
      appbarTitle: 'create_pool_appbar_title',
      submitButton: SomeFormSubmitButton(
        formState: BlocProvider.of<CreatePoolCubit>(context),
      ),
      children: [
        ChooseAccount(
          passwordController:
              BlocProvider.of<CreatePoolCubit>(context).passwordController,
          onAccountSelected: null,
        ),
        StatefulPoolAssetChoice<CreatePoolCubit, CreatePoolState>(
          assetNum: '1',
          onChanged: cubit.setAsset1,
          buildWhen: (final previous, final current) =>
              previous.asset1 != current.asset1,
        ),
        StatefulPoolAssetChoice<CreatePoolCubit, CreatePoolState>(
          assetNum: '2',
          onChanged: cubit.setAsset2,
          buildWhen: (final previous, final current) =>
              previous.asset2 != current.asset2,
        ),
      ],
    );
  }
}
