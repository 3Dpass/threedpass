import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:threedpass/core/theme/d3p_special_colors.dart';
import 'package:threedpass/core/widgets/appbars/d3p_platfrom_appbar.dart';
import 'package:threedpass/core/widgets/buttons/custom_back_button.dart';
import 'package:threedpass/core/widgets/buttons/icon_button.dart';

abstract class CustomSelectSettingsSubPage extends StatefulWidget {
  const CustomSelectSettingsSubPage({super.key});
}

abstract class CustomSelectSettingsSubPageState<T>
    extends State<CustomSelectSettingsSubPage> {
  String get appbarTitle;

  ValueNotifier<T> get chosenValue;

  // void onSavePressed(final BuildContext context);
  Widget bodyBuilderOverride(final BuildContext context);

  @override
  Widget build(final BuildContext context) {
    final theme = Theme.of(context);
    return PlatformScaffold(
      backgroundColor: theme.customColors.scaffoldBackground,
      appBar: D3pPlatformAppBar(
        textAlign: TextAlign.center,
        titleText: appbarTitle,
        leading: const CustomBackButton(),
        trailingActions: [
          const D3pIconButton.fake(),
        ],
      ),
      // ignore: avoid-returning-widgets
      body: bodyBuilderOverride(context),
    );
  }
}
