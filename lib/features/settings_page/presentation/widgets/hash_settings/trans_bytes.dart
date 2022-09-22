import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:threedpass/core/widgets/input/textformfield.dart';
import 'package:threedpass/features/settings_page/bloc/settings_page_cubit.dart';
import 'package:threedpass/features/settings_page/domain/entities/global_settings.dart';
import 'package:threedpass/features/settings_page/domain/entities/scan_settings.dart';

class TransBytesInput extends StatelessWidget {
  TransBytesInput({
    Key? key,
    required SettingsConfigCubit settingsConfigCubit,
  })  : controller = TextEditingController(
          text: hexInputFormatter.maskText(
            settingsConfigCubit.state.scanSettings.transBytes,
          ),
        ),
        super(key: key);

  final TextEditingController controller;

  static final hexInputFormatter = MaskTextInputFormatter(
    mask: '0x########',
    filter: {'#': RegExp(r'[0-9A-Fa-f]')},
    type: MaskAutoCompletionType.lazy,
  );

  void changeSettings(String input, BuildContext context) {
    final realInput = hexInputFormatter.unmaskText(input);

    /// @see [validator] comment
    if (realInput.isEmpty || realInput.length == 8) {
      final cubit = BlocProvider.of<SettingsConfigCubit>(context);
      final newScanConfig =
          cubit.state.scanSettings.copyWith(transBytes: realInput);
      final newState = cubit.state.copyWith(scanSettings: newScanConfig);
      cubit.updateSettings(newState);
    }
  }

  /// Empty input means, that trans bytes should be taken from chain.
  /// Else user's 8 len input will be used by calc library
  String? validator(String? value) {
    if (value == null || value.isEmpty) {
      return null;
    }

    if (int.tryParse(value) != null && value.length == 8) {
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
      suffixButton: 'Clear'.tr(),
      onSuffixButtonPressed: () => onClearPressed(context),
      onChanged: (value) => changeSettings(value ?? '', context),
      validator: validator,
      inputFormatters: [hexInputFormatter],
      bottomHelpText: 'trans_help_text'.tr(),
    );
  }
}
