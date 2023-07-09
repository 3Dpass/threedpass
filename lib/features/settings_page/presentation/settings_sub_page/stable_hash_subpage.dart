import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/features/settings_page/bloc/settings_page_cubit.dart';
import 'package:threedpass/features/settings_page/domain/entities/app_settings.dart';
import 'package:threedpass/features/settings_page/domain/entities/global_settings.dart';
import 'package:threedpass/features/settings_page/presentation/settings_sub_page/setting_sub_page.dart';
import 'package:threedpass/features/settings_page/presentation/widgets/app_settings/requirements_textfield.dart';

@RoutePage()
class StableHashSubPage extends SettingSubPage {
  StableHashSubPage({
    required final GlobalSettings initialState,
    super.key,
  }) {
    controller = TextEditingController(
      text: initialState.appSettings.stableRequirement.toString(),
    );
  }

  late final TextEditingController controller;

  @override
  final String appbarTitle = 'stable_requirement_label';

  @override
  void onSavePressed(final BuildContext context) {
    _onFieldChanged(context, controller.text);
  }

  @override
  Widget bodyBuilder(final BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      child: RequirementsTextField(
        controller: controller,
      ),
    );
  }

  static Future<void> _onFieldChanged(
    final BuildContext context,
    final String? newValue,
  ) async {
    if (newValue == null) {
      return;
    } // value is not null

    final actualValue = int.tryParse(newValue);
    if (actualValue == null) {
      return;
    } // value is an integer

    if (actualValue <= 0) {
      return;
    } // value is positive

    final cubit = BlocProvider.of<SettingsConfigCubit>(context);
    final newAppConfig =
        cubit.state.appSettings.copyWith(stableRequirement: actualValue);
    final newState = cubit.state.copyWith(appSettings: newAppConfig);
    cubit.updateSettings(newState);
  }
}
