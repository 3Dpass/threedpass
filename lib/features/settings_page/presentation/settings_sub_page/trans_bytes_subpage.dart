import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/features/settings_page/bloc/settings_page_cubit.dart';
import 'package:threedpass/features/settings_page/domain/entities/global_settings.dart';
import 'package:threedpass/features/settings_page/domain/entities/scan_settings.dart';
import 'package:threedpass/features/settings_page/presentation/settings_sub_page/setting_sub_page.dart';
import 'package:threedpass/features/settings_page/presentation/widgets/hash_settings/trans_bytes.dart';

@RoutePage()
class TransBytesSubPage extends SettingSubPage {
  TransBytesSubPage({
    required final GlobalSettings initialState,
    super.key,
  }) {
    controller = TextEditingController(
      text: hexInputFormatter.maskText(
        initialState.scanSettings.transBytes,
      ),
    );
  }

  static final hexInputFormatter = TransBytesMaskTextInputFormatter();

  late final TextEditingController controller;

  @override
  final String appbarTitle = 'trans_bytes_input_label';

  @override
  void onSavePressed(final BuildContext context) {
    changeSettings(controller.text, context);
  }

  @override
  Widget bodyBuilder(final BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      child: TransBytesInputField(
        controller: controller,
      ),
    );
  }

  void changeSettings(final String rawInput, final BuildContext context) {
    final smartInput = TransBytesInput(rawInput);
    if (smartInput.isValid == null) {
      final realInput = smartInput.unmasked.toLowerCase();
      final cubit = BlocProvider.of<SettingsConfigCubit>(context);
      final newScanConfig =
          cubit.state.scanSettings.copyWith(transBytes: realInput);
      final newState = cubit.state.copyWith(scanSettings: newScanConfig);
      cubit.updateSettings(newState);
    }
  }
}
