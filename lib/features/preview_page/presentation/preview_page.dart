import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/widgets/d3p_scaffold.dart';
import 'package:threedpass/features/preview_page/bloc/preview_page_cubit.dart';
import 'package:threedpass/features/preview_page/presentation/widgets/appbar/preview_appbar.dart';
import 'package:threedpass/features/preview_page/presentation/widgets/preview_page_body.dart';

@RoutePage()
class PreviewPage extends StatelessWidget {
  const PreviewPage({
    final Key? key,
  }) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    final previewPageCubitState =
        BlocProvider.of<PreviewPageCubit>(context).state;

    return D3pScaffold(
      appBarWidget: PreviewAppbarTitle(
        hashObject: previewPageCubitState.hashObject,
      ),
      body: SingleChildScrollView(
        child: PreviewPageBody(
          previewPageCubitState: previewPageCubitState,
        ),
      ),
    );
  }
}
