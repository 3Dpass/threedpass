import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/features/settings_page/bloc/settings_page_cubit.dart';
import 'package:threedpass/features/settings_page/domain/entities/global_settings.dart';
import 'package:threedpass/features/settings_page/domain/entities/preview_settings.dart';
import 'package:threedpass/features/settings_page/presentation/settings_sub_page/custom_select_settings_subpage.dart';
import 'package:threedpass/features/settings_page/presentation/widgets/preview_settings/pixel_ratio_slider.dart';

@RoutePage()
class PixelRatioSubPage extends CustomSelectSettingsSubPage {
  const PixelRatioSubPage({super.key});

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends CustomSelectSettingsSubPageState<double> {
  _State();

  @override
  void initState() {
    final settings = BlocProvider.of<SettingsConfigCubit>(context).state;
    chosenValue = ValueNotifier<double>(settings.previewSettings.pixelRatio);
    chosenValue.addListener(() => onPressed(context));
    super.initState();
  }

  @override
  final String appbarTitle = 'preview_settings_pixel_ratio_label';

  @override
  Widget bodyBuilderOverride(final BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: PixelRatioSlider(
        valueNotifier: chosenValue,
      ),
    );
  }

  @override
  late final ValueNotifier<double> chosenValue;

  void onPressed(final BuildContext context) {
    setState(() {
      final newValue = chosenValue.value;
      final cubit = BlocProvider.of<SettingsConfigCubit>(context);
      final newPreviewConfig =
          cubit.state.previewSettings.copyWith(pixelRatio: newValue);
      final newState = cubit.state.copyWith(previewSettings: newPreviewConfig);
      cubit.updateSettings(newState);
    });
  }
}
