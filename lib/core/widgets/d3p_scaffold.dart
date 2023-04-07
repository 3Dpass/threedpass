import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:threedpass/core/theme/d3p_special_colors.dart';
import 'package:threedpass/core/widgets/appbars/d3p_platfrom_appbar.dart';
import 'package:threedpass/features/preview_page/bloc/outer_context_cubit.dart';

class D3pScaffold extends StatelessWidget {
  final Widget body;
  final String appbarTitle;
  final bool? removeBackButton;
  final bool translateAppbar;

  const D3pScaffold({
    required this.body,
    required this.appbarTitle,
    this.removeBackButton,
    this.translateAppbar = true,
    super.key,
  });

  @override
  Widget build(final BuildContext context) {
    return PlatformScaffold(
      appBar: D3pPlatformAppBar(
        titleText: appbarTitle,
        leading: removeBackButton ?? false ? null : const _CustomBackButton(),
        translateAppbar: translateAppbar,
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

  /// Returns the appropriate "back" icon for the given `platform`.
  /// Copied from `BackButtonIcon()`
  static IconData _getIconData(final TargetPlatform platform) {
    switch (platform) {
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
        return Icons.arrow_back;
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
        return Icons.arrow_back_ios;
    }
  }

  @override
  Widget build(final BuildContext context) {
    final needSpecialPop = !context.router.canPopSelfOrChildren;
    final theme = Theme.of(context);

    return PlatformIconButton(
      icon: Icon(
        _getIconData(theme.platform),
        color: theme.customColors.themeOpposite,
      ),
      onPressed:
          needSpecialPop ? () => outerPop(context) : () => usualPop(context),
    );
  }
}
