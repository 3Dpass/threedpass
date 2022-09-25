import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/widgets/input/textformfield/textformfield.dart';
import 'package:threedpass/features/settings_page/domain/entities/global_settings.dart';
import 'package:threedpass/features/settings_page/domain/entities/scan_settings.dart';
import 'package:threedpass/features/settings_page/bloc/settings_page_cubit.dart';

class SectionsTextField extends StatelessWidget {
  const SectionsTextField({Key? key}) : super(key: key);

  Future<void> _onFieldChanged(
    BuildContext context,
    ScanSettings settings,
    String? newValue,
  ) async {
    if (newValue != null && int.tryParse(newValue) != null) {
      final cubit = BlocProvider.of<SettingsConfigCubit>(context);
      final newScanConfig =
          cubit.state.scanSettings.copyWith(nSections: int.parse(newValue));
      final newState = cubit.state.copyWith(scanSettings: newScanConfig);
      cubit.updateSettings(newState);
    }
  }

  static String? onlyNumValidator(String? value) {
    if (value != null && int.tryParse(value) != null) {
      return null;
    } else {
      return 'error_n_sections_validator'.tr();
    }
  }

  @override
  Widget build(BuildContext context) {
    final settings =
        BlocProvider.of<SettingsConfigCubit>(context).state.scanSettings;

    return D3pTextFormField(
      controller: TextEditingController(
        text: settings.nSections.toString(),
      ),
      onChanged: (String? newValue) =>
          _onFieldChanged(context, settings, newValue),
      keyboardType: TextInputType.number,
      validator: onlyNumValidator,
      labelText: 'n_sections_label'.tr(),
    );
  }
}
