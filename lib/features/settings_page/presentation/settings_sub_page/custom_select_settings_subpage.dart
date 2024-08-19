import 'package:flutter/material.dart';
import 'package:threedpass/core/widgets/d3p_scaffold.dart';

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
    return D3pScaffold(
      appBarTitle: appbarTitle,
      // ignore: avoid-returning-widgets
      body: bodyBuilderOverride(context),
    );
  }
}
