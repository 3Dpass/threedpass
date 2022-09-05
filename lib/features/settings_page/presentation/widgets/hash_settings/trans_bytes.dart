import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/widgets/input/textformfield.dart';
import 'package:threedpass/features/settings_page/bloc/settings_page_cubit.dart';
import 'package:threedpass/features/settings_page/domain/entities/global_settings.dart';
import 'package:threedpass/features/settings_page/domain/entities/scan_settings.dart';

class TransBytesInput extends StatelessWidget {
  TransBytesInput({
    Key? key,
  }) : super(key: key);

  final TextEditingController controller = TextEditingController();

  void changeSettings(String input, BuildContext context) {
    final cubit = BlocProvider.of<SettingsConfigCubit>(context);
    final newScanConfig = cubit.state.scanSettings.copyWith(transBytes: input);
    final newState = cubit.state.copyWith(scanSettings: newScanConfig);
    cubit.updateSettings(newState);
  }

  String? validator(String? value) {
    if (value != null && int.tryParse(value) != null && value.length == 8) {
      return null;
    } else {
      return 'error_hex'.tr();
    }
  }

  void onClearPressed(BuildContext context) {
    controller.clear();
    changeSettings('', context);
  }

  @override
  Widget build(BuildContext context) {
    return D3pTextFormField(
      controller: controller,
      labelText: 'trans_bytes_input_label'.tr(),
      // inputFormatters: [
      //   FilteringTextInputFormatter.digitsOnly,
      // ],
      maxLen: 8,
      suffixButton: 'Clear',
      onSuffixButtonPressed: () => onClearPressed(context),
      onChanged: (value) => changeSettings(value ?? '', context),
      validator: validator,
    );
  }
}
