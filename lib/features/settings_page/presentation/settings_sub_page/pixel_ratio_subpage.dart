import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/features/settings_page/bloc/settings_page_cubit.dart';
import 'package:threedpass/features/settings_page/domain/entities/global_settings.dart';
import 'package:threedpass/features/settings_page/domain/entities/preview_settings.dart';
import 'package:threedpass/features/settings_page/presentation/settings_sub_page/setting_sub_page.dart';
import 'package:threedpass/features/settings_page/presentation/widgets/preview_settings/pixel_ratio_slider.dart';

@RoutePage()
class PixelRatioSubPage extends SettingSubPage {
  PixelRatioSubPage({
    required final GlobalSettings initialState,
    super.key,
  }) : valueNotifier =
            ValueNotifier<double>(initialState.previewSettings.pixelRatio);

  // late final TextEditingController controller;
  late final ValueNotifier<double> valueNotifier;

  @override
  final String appbarTitle = 'preview_settings_pixel_ratio_label';

  @override
  void onSavePressed(final BuildContext context) {
    final newValue = valueNotifier.value;
    final cubit = BlocProvider.of<SettingsConfigCubit>(context);
    final newPreviewConfig =
        cubit.state.previewSettings.copyWith(pixelRatio: newValue);
    final newState = cubit.state.copyWith(previewSettings: newPreviewConfig);
    cubit.updateSettings(newState);
  }

  @override
  Widget bodyBuilder(final BuildContext context) {
    return PixelRatioSlider(
      valueNotifier: valueNotifier,
    );
  }
}
