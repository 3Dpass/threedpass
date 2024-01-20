import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:threedpass/core/widgets/appbars/d3p_platfrom_appbar.dart';
import 'package:threedpass/core/widgets/buttons/custom_back_button.dart';

class D3pScaffold extends StatelessWidget {
  final Widget body;
  final String appbarTitle;
  final bool? removeBackButton;
  final bool translateAppbar;
  final Widget? floatingActionButton;

  const D3pScaffold({
    required this.appbarTitle,
    required this.body,
    this.floatingActionButton,
    this.removeBackButton,
    this.translateAppbar = true,
    super.key,
  });

  @override
  Widget build(final BuildContext context) {
    return PlatformScaffold(
      appBar: D3pPlatformAppBar(
        titleText: appbarTitle,
        leading: removeBackButton ?? false ? null : const CustomBackButton(),
        translateAppbar: translateAppbar,
      ),
      body: floatingActionButton != null
          ? Stack(
              children: [
                body,
                Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: floatingActionButton,
                  ),
                ),
              ],
            )
          : body,
    );
  }
}
