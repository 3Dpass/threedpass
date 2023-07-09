// part of '../../settings_page.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/theme/d3p_special_styles.dart';
import 'package:threedpass/features/settings_page/bloc/settings_page_cubit.dart';
import 'package:threedpass/features/settings_page/presentation/widgets/settings_section_header.dart';

class ScanSettingsTitle extends StatelessWidget {
  const ScanSettingsTitle({
    final Key? key,
  }) : super(key: key);
  @override
  Widget build(final BuildContext context) {
    final libVersion = BlocProvider.of<SettingsConfigCubit>(context)
        .state
        .scanSettings
        .libVersion;

    final textStyles = Theme.of(context).customTextStyles;
    return SettingsSectionHeader(
      title: 'hash_settings_title',
      additionalText: ' | ' + 'lib_version_label'.tr() + ' ' + libVersion,
    );
  }
}
