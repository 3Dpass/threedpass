import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:threedpass/core/widgets/other/form_field_error_text.dart';
import 'package:threedpass/core/widgets/other/padding_16.dart';

class D3pSwitchFormField extends FormField<bool> {
  D3pSwitchFormField({
    final bool initialValue = false,
    final String? Function(bool?) validator = _onlyTrue,
    final void Function(bool)? onChanged,
    required final String localizationKey,
    super.key,
  }) : super(
          initialValue: initialValue,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: validator,
          builder: (final FormFieldState<bool> state) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SwitchListTile.adaptive(
                  value: state.value ?? initialValue,
                  onChanged: (final p0) {
                    state.didChange(p0);
                    onChanged?.call(p0);
                  },
                  title: Text(localizationKey.tr()),
                ),
                Padding16(
                  child: FormFieldErrorText(state),
                ),
              ],
            );
          },
        );
}

String? _onlyTrue(final bool? p0) =>
    (p0 ?? false) ? null : 'error_only_true'.tr();
