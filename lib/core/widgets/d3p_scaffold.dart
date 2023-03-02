import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:threedpass/core/widgets/appbars/d3p_platfrom_appbar.dart';
import 'package:threedpass/features/preview_page/bloc/outer_context_cubit.dart';

class D3pScaffold extends StatelessWidget {
  final Widget body;
  final String appbarTitle;
  final bool? removeBackButton;

  const D3pScaffold({
    required this.body,
    required this.appbarTitle,
    this.removeBackButton,
    super.key,
  });

  @override
  Widget build(final BuildContext context) {
    return PlatformScaffold(
      appBar: D3pPlatformAppBar(
        titleText: appbarTitle,
        leading: removeBackButton ?? false ? null : const _CustomBackButton(),
      ),
      body: body,
    );
  }
}

class _CustomBackButton extends StatelessWidget {
  const _CustomBackButton();

  void outerPop(final BuildContext context) {
    final outerContext = BlocProvider.of<OuterContextCubit>(context).state;
    Navigator.pop(outerContext);
  }

  Future<bool> usualPop(final BuildContext context) async {
    return context.router.pop();
  }

  @override
  Widget build(final BuildContext context) {
    final needSpecialPop = !context.router.canPopSelfOrChildren;

    return PlatformIconButton(
      icon: const BackButtonIcon(),
      onPressed:
          needSpecialPop ? () => outerPop(context) : () => usualPop(context),
    );
  }
}
