import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
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
    final previewPageCubitState =
        BlocProvider.of<PreviewPageCubit>(context).state;
    final object = previewPageCubitState.hashObject;
    return D3pScaffold(
      appBarLeading: const CustomBackButton(),
      appBarTitle: object != null ? object.name : 'unsaved_object_appbar'.tr(),
      translateAppbar: false,
      body: SingleChildScrollView(
        child: PreviewPageBody(
          previewPageCubitState: previewPageCubitState,
        ),
      ),
    );
  }
}
