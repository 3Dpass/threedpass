import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/widgets/d3p_card.dart';
import 'package:threedpass/features/settings_page/bloc/settings_page_cubit.dart';
import 'package:threedpass/features/settings_page/domain/entities/global_settings.dart';
import 'package:threedpass/features/settings_page/presentation/widgets/default_settings_button.dart';
import 'package:threedpass/router/router.gr.dart';
import 'package:unicons/unicons.dart';

class PixelRatioButton extends StatelessWidget {
  const PixelRatioButton({super.key});

  void onPressed(final BuildContext context) {
    context.router.push(const PixelRatioSubRoute());
  }

  @override
  Widget build(final BuildContext context) {
    return BlocBuilder<SettingsConfigCubit, GlobalSettings>(
      buildWhen: (final previous, final current) =>
          previous.previewSettings.pixelRatio !=
          current.previewSettings.pixelRatio,
      builder: (final context, final state) {
        return DefaultSettingsButton.openButton(
          iconData: UniconsLine.exposure_alt,
          iconColor: Colors.green,
          textValue: state.previewSettings.pixelRatio.toString(),
          onPressed: () => onPressed(context),
          text: 'preview_settings_pixel_ratio_label',
          cardShape: CardShape.top,
        );
      },
    );
  }
}
