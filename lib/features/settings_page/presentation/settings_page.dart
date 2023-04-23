import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:threedpass/core/theme/d3p_special_styles.dart';
import 'package:threedpass/core/widgets/buttons/dropdown_button.dart';
import 'package:threedpass/core/widgets/input/switch_button.dart';
import 'package:threedpass/core/widgets/input/textformfield/textformfield.dart';
import 'package:threedpass/core/widgets/paddings.dart';
import 'package:threedpass/features/settings_page/bloc/settings_page_cubit.dart';
import 'package:threedpass/features/settings_page/domain/entities/algorithm.dart';
import 'package:threedpass/features/settings_page/domain/entities/app_settings.dart';
import 'package:threedpass/features/settings_page/domain/entities/global_settings.dart';
import 'package:threedpass/features/settings_page/domain/entities/scan_settings.dart';
import 'package:threedpass/features/settings_page/presentation/widgets/preview_settings_block.dart';
import 'package:threedpass/features/settings_page/presentation/widgets/settings_appbar.dart';
import 'package:threedpass/features/settings_page/presentation/widgets/wallet_settings_block.dart';
import 'package:threedpass/setup.dart';

part './widgets/app_settings/app_settings.dart';
part './widgets/app_settings/dark_theme_switch.dart';
part './widgets/app_settings/show_zero_assets.dart';
part './widgets/app_settings/requirements_textfield.dart';
part './widgets/hash_settings/algorithm_dropdown.dart';
part './widgets/hash_settings/grid_size_dropdown.dart';
part './widgets/hash_settings/hash_settings_title.dart';
part './widgets/hash_settings/sections_textfield.dart';
part './widgets/hash_settings/trans_bytes.dart';
part './widgets/hash_settings_block.dart';
part './widgets/version_info.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({
    final Key? key,
  }) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    return PlatformScaffold(
      appBar: SettingsAppbar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              SizedBoxH16(),
              _HashSettingsBlock(),
              PreviewSettingsBlock(),
              WalletSettingsBlock(),
              _AppSettingsBlock(),
              SizedBoxH16(),
              _VersionInfo(),
              SizedBoxH8(),
            ],
          ),
        ),
      ),
    );
  }
}
