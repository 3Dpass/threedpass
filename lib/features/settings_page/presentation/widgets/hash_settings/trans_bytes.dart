part of '../../settings_page.dart';

/// Empty input means, that trans bytes should be taken from chain.
/// Else user's 8 len input will be used by calc library
class _TransBytesInputField extends StatefulWidget {
  const _TransBytesInputField({final Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<_TransBytesInputField> {
  @override
  void initState() {
    controller = TextEditingController(
      text: hexInputFormatter.maskText(
        BlocProvider.of<SettingsConfigCubit>(context)
            .state
            .scanSettings
            .transBytes,
      ),
    );
    super.initState();
  }

  static final hexInputFormatter = _TransBytesMaskTextInputFormatter();

  late final TextEditingController controller;

  void changeSettings(final String rawInput, final BuildContext context) {
    final smartInput = _TransBytesInput(rawInput);
    if (smartInput.isValid == null) {
      final realInput = smartInput.unmasked;
      final cubit = BlocProvider.of<SettingsConfigCubit>(context);
      final newScanConfig =
          cubit.state.scanSettings.copyWith(transBytes: realInput);
      final newState = cubit.state.copyWith(scanSettings: newScanConfig);
      cubit.updateSettings(newState);
    }
  }

  void onClearPressed(final BuildContext context) {
    controller.clear();
    changeSettings('', context);
  }

  @override
  Widget build(final BuildContext context) {
    return D3pTextFormField(
      controller: controller,
      labelText: 'trans_bytes_input_label'.tr(),
      suffixButton: 'Clear'.tr(),
      onSuffixButtonPressed: () => onClearPressed(context),
      onChanged: (final value) => changeSettings(value ?? '', context),
      validator: (final input) => _TransBytesInput(input ?? '').isValid,
      inputFormatters: [hexInputFormatter],
      bottomHelpText: 'trans_help_text'.tr(),
    );
  }
}

class _TransBytesMaskTextInputFormatter extends MaskTextInputFormatter {
  _TransBytesMaskTextInputFormatter()
      : super(
          mask: '0x########',
          filter: {'#': RegExp(r'[0-9A-Fa-f]')},
          type: MaskAutoCompletionType.lazy,
        );
}

class _TransBytesInput {
  final String rawInput;

  static final hexInputFormatter = _TransBytesMaskTextInputFormatter();

  _TransBytesInput(this.rawInput);

  /// Does field should show an error?
  String? get isValid {
    final realInput = hexInputFormatter.unmaskText(rawInput);
    if (int.tryParse(realInput) != null && realInput.length == 8) {
      print('Valid $realInput');
      return null;
    } else {
      return 'error_hex'.tr();
    }
  }

  String get unmasked => hexInputFormatter.unmaskText(rawInput);
}
