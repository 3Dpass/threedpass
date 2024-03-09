import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/widgets/d3p_card.dart';
import 'package:threedpass/features/settings_page/bloc/settings_page_cubit.dart';
import 'package:threedpass/features/settings_page/domain/entities/global_settings.dart';
import 'package:threedpass/features/settings_page/domain/entities/scan_settings.dart';
import 'package:threedpass/features/settings_page/presentation/settings_sub_page/trans_bytes_subpage.dart';
import 'package:threedpass/features/settings_page/presentation/widgets/default_settings_button.dart';
import 'package:threedpass/router/router.gr.dart';
import 'package:unicons/unicons.dart';

class TransBytesButton extends StatelessWidget {
  const TransBytesButton({super.key});

  void onPressed(final BuildContext context) {
    final settingsState = BlocProvider.of<SettingsConfigCubit>(context).state;
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
    return BlocBuilder<SettingsConfigCubit, GlobalSettings>(
      buildWhen: (final previous, final current) =>
          previous.scanSettings.transBytes != current.scanSettings.transBytes ||
          previous.scanSettings.transBytesMode !=
              current.scanSettings.transBytesMode,
      builder: (final context, final state) {
        final scanSettings = state.scanSettings;
        final text = transBytesSettingsToText(scanSettings);

        return DefaultSettingsButton.openButton(
          text: 'trans_bytes_input_label',
          iconData: UniconsLine.shuffle,
          iconColor: Colors.purple,
          textValue: text,
          onPressed: () => onPressed(context),
          cardShape: CardShape.bottom,
        );
      },
    );
  }
}
