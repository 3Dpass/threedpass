import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/widgets/buttons/enum_button.dart';
import 'package:threedpass/core/widgets/buttons/enum_buttons_list.dart';
import 'package:threedpass/features/settings_page/bloc/settings_cubit.dart';
import 'package:threedpass/features/settings_page/domain/entities/global_settings.dart';
import 'package:threedpass/features/settings_page/domain/entities/scan_settings.dart';
import 'package:threedpass/features/settings_page/presentation/settings_sub_page/setting_sub_page.dart';
import 'package:threedpass/features/settings_page/presentation/widgets/hash_settings/trans_bytes.dart';

@RoutePage()
class TransBytesSubPage extends StatefulWidget {
  final GlobalSettings initialState;

  const TransBytesSubPage({
    required this.initialState,
    super.key,
  });

  @override
  State<TransBytesSubPage> createState() => _TransBytesSubPageState();
}

class _TransBytesSubPageState extends State<TransBytesSubPage> {
  _TransBytesSubPageState();
  @override
  void initState() {
    controller = TextEditingController(
      text: hexInputFormatter.maskText(
        widget.initialState.scanSettings.transBytes,
      ),
    );
    chosennTBM = widget.initialState.scanSettings.transBytesMode;
    super.initState();
  }

  static final hexInputFormatter = TransBytesMaskTextInputFormatter();

  late final TextEditingController controller;
  late TransBytesMode chosennTBM;

  final _formKey = GlobalKey<FormState>();

  void onSavePressed(final BuildContext context) {
    if (_formKey.currentState!.validate()) {
      changeSettings(controller.text, context);
    }
  }

  void changeSettings(final String rawInput, final BuildContext context) {
    final cubit = BlocProvider.of<SettingsCubit>(context);

    // Set transBytes
    String newTransBytes = cubit.state.scanSettings.transBytes;
    if (chosennTBM == TransBytesMode.specific) {
      final smartInput = TransBytesInput(rawInput);
      final realInput = smartInput.unmasked.toLowerCase();
      newTransBytes = realInput;
    }

    // Update settings
    final newScanConfig = cubit.state.scanSettings
        .copyWith(transBytes: newTransBytes, transBytesMode: chosennTBM);
    final newState = cubit.state.copyWith(scanSettings: newScanConfig);
    cubit.updateSettings(newState);
  }

  void onEnumPressed(final TransBytesMode mode) {
    setState(() {
      chosennTBM = mode;
      _formKey.currentState?.validate();
    });
  }

  @override
  Widget build(final BuildContext context) {
    return SettingSubPage(
      appbarTitle: 'trans_bytes_input_label',
      onSavePressed: onSavePressed,
      child: Column(
        children: [
          EnumButtonsList(
            length: TransBytesMode.values.length,
            itemBuilder: (final BuildContext context, final int index) {
              final mode = TransBytesMode.values[index];
              return EnumButton(
                text: mode.localizedName,
                isChosen: mode == chosennTBM,
                onPressed: () => onEnumPressed(mode),
              );
            },
          ),
          Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              child: TransBytesInputField(
                controller: controller,
                enabled: chosennTBM == TransBytesMode.specific,
                validator: (final input) =>
                    chosennTBM == TransBytesMode.specific
                        ? TransBytesInput(input ?? '').isValid
                        : null,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

extension LocalizedTransBytesMode on TransBytesMode {
  String get localizedName {
    switch (this) {
      case TransBytesMode.none:
        return 'trans_bytes_none'.tr();
      case TransBytesMode.random:
        return 'trans_bytes_random'.tr();
      case TransBytesMode.specific:
        return 'trans_bytes_specific'.tr();
    }
  }
}
