import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:threedpass/core/widgets/appbars/common_logo_appbar.dart';
import 'package:threedpass/features/settings_page/presentation/widgets/grid_size_dropdown.dart';
import 'package:threedpass/features/settings_page/presentation/widgets/sections_textfield.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonLogoAppbar(
        title: 'settings_title'.tr(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: const [
            // AlgorithmDropdown(),
            GridSizeDropdown(),
            SectionsTextField(),
          ],
        ),
      ),
    );
  }
}
