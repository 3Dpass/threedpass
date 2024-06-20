import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/features/asset_conversion/ui/create_pool/bloc/create_pool_cubit.dart';
import 'package:threedpass/features/other/some_form/some_form.dart';

@RoutePage()
class CreatePoolPage extends StatelessWidget {
  const CreatePoolPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SomeForm(
      formKey: BlocProvider.of<CreatePoolCubit>(context).formKey,
      appbarTitle: 'create_pool_appbar_title',
      submitButton: const SizedBox(),
      children: const [],
    );
  }
}
