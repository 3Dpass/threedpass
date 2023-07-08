import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/features/settings_page/bloc/settings_page_cubit.dart';
import 'package:threedpass/features/settings_page/domain/entities/global_settings.dart';
import 'package:threedpass/features/settings_page/domain/entities/scan_settings.dart';
import 'package:threedpass/features/settings_page/presentation/settings_sub_page/setting_sub_page.dart';
import 'package:threedpass/features/settings_page/presentation/widgets/hash_settings/sections_textfield.dart';

@RoutePage()
class SectionsSubPage extends SettingSubPage {
  SectionsSubPage({
    required final GlobalSettings initialState,
    super.key,
  }) {
    controller = TextEditingController(
      text: initialState.scanSettings.nSections.toString(),
    );
  }

  late final TextEditingController controller;

  @override
  final String appbarTitle = 'n_sections_label';

  @override
  void onSavePressed(final BuildContext context) {
    _onFieldChanged(context, controller.text);
  }

  @override
  Widget bodyBuilder(final BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      child: SectionsTextField(
        controller: controller,
      ),
    );
  }

  static Future<void> _onFieldChanged(
    final BuildContext context,
    final String? newValue,
  ) async {
    if (newValue != null && int.tryParse(newValue) != null) {
      final cubit = BlocProvider.of<SettingsConfigCubit>(context);
      final newScanConfig =
          cubit.state.scanSettings.copyWith(nSections: int.parse(newValue));
      final newState = cubit.state.copyWith(scanSettings: newScanConfig);
      cubit.updateSettings(newState);
    }
  }
}
