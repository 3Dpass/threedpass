import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/widgets/buttons/custom_back_button.dart';
import 'package:threedpass/core/widgets/d3p_scaffold.dart';
import 'package:threedpass/features/preview/preview_page/bloc/preview_page_cubit.dart';
import 'package:threedpass/features/preview/preview_page/presentation/widgets/preview_page_body.dart';

@RoutePage()
class PreviewPage extends StatelessWidget {
  const PreviewPage({
    final Key? key,
  }) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    final ppc = BlocProvider.of<PreviewPageCubit>(context);
    final object = ppc.hashObject;
    return D3pScaffold(
      appBarLeading: const CustomBackButton(),
      appBarTitle: object.name,
      translateAppbar: false,
      body: const SingleChildScrollView(
        child: PreviewPageBody(),
      ),
    );
  }
}
