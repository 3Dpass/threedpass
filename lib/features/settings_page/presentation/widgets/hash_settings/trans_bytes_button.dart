import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/theme/d3p_colors.dart';
import 'package:threedpass/core/widgets/d3p_card.dart';
import 'package:threedpass/core/widgets/other/padding_16.dart';
import 'package:threedpass/features/settings_page/bloc/settings_cubit.dart';
import 'package:threedpass/features/settings_page/domain/entities/global_settings.dart';
import 'package:threedpass/features/settings_page/domain/entities/scan_settings.dart';
import 'package:threedpass/features/settings_page/presentation/settings_sub_page/trans_bytes_subpage.dart';
import 'package:threedpass/features/settings_page/presentation/widgets/default_settings_button.dart';
import 'package:threedpass/router/router.gr.dart';
import 'package:unicons/unicons.dart';

class TransBytesButton extends StatelessWidget {
  const TransBytesButton({super.key});

  void onPressed(final BuildContext context) {
    final settingsState = BlocProvider.of<SettingsCubit>(context).state;
    context.router.push(TransBytesSubRoute(initialState: settingsState));
  }

  String transBytesSettingsToText(final ScanSettings scanSettings) {
    if (scanSettings.transBytesMode == TransBytesMode.specific) {
      return '0x${scanSettings.transBytes}';
    } else {
      return scanSettings.transBytesMode.localizedName;
    }
  }

  @override
  Widget build(final BuildContext context) {
    return Padding16(
      child: BlocBuilder<SettingsCubit, GlobalSettings>(
        buildWhen: (final previous, final current) =>
            previous.scanSettings.transBytes !=
                current.scanSettings.transBytes ||
            previous.scanSettings.transBytesMode !=
                current.scanSettings.transBytesMode,
        builder: (final context, final state) {
          final scanSettings = state.scanSettings;
          final text = transBytesSettingsToText(scanSettings);

          return LineButton(
            icon: const Icon(
              UniconsLine.shuffle,
              color: Colors.purple,
            ),
            localization_key: 'trans_bytes_input_label',
            goToBasicRight: LineButtonRightValue(
              chevronColor: D3pColors.disabled,
              value: text,
            ),
            onBasePressed: () => onPressed(context),
            cardShape: CardShape.bottom,
          );
        },
      ),
    );
  }
}
