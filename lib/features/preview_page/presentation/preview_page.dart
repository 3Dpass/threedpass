import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
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

    return PlatformScaffold(
      appBar: PreviewAppBar(
        hashObject: previewPageCubitState.hashObject,
        psType: previewPageCubitState.psType,
        themeData: Theme.of(context),
        context: context,
      ),
      body: SingleChildScrollView(
        child: PreviewPageBody(
          previewPageCubitState: previewPageCubitState,
        ),
      ),
    );
  }
}
