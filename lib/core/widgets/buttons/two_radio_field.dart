import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:threedpass/core/widgets/paddings.dart';
import 'package:threedpass/core/widgets/text/d3p_body_medium_text.dart';

enum TwoRadioState { nothing, first, second }

class TwoRadioField extends FormField<TwoRadioState> {
  TwoRadioField({
    required final (String, String) label,
    required final String titleKey,
    final TwoRadioState? value = TwoRadioState.nothing,
    final String? Function(TwoRadioState?) validator = _defaultValidator,
    final void Function(TwoRadioState)? onChanged,
    super.key,
  }) : super(
          initialValue: value,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: validator,
          builder: (final FormFieldState<TwoRadioState> state) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                D3pBodyMediumText(titleKey),
                const H4(),
                Flexible(
                  child: Row(mainAxisSize: MainAxisSize.max, children: [
                    Flexible(
                      child: _SpecialRadioListTile(
                        title: label.$1,
                        textTheme: textTheme(state.context),
                        value: TwoRadioState.first,
                        groupValue: state.value,
                        onChanged: (final value) => onChangedDefault(
                          value,
                          state,
                          onChanged,
                        ),
                      ),
                    ),
                    const Spacer(),
                    Flexible(
                      child: _SpecialRadioListTile(
                        title: label.$2,
                        textTheme: textTheme(state.context),
                        value: TwoRadioState.second,
                        groupValue: state.value,
                        onChanged: (final value) =>
                            onChangedDefault(value, state, onChanged),
                      ),
                    ),
                  ]),
                ),
                if (state.hasError)
                  Text(
                    state.errorText ?? '',
                    style: textTheme(state.context).bodyMedium!.copyWith(
                          color: Theme.of(state.context).colorScheme.error,
                        ),
                  ),
              ],
            );
          },
        );

  static void onChangedDefault(
    final TwoRadioState? value,
    final FormFieldState<TwoRadioState> state,
    final void Function(TwoRadioState)? callBack,
  ) {
    state.didChange(value);
    // state.validate();
    if (callBack != null) {
      callBack(value ?? TwoRadioState.nothing);
    }
  }

  static TextTheme textTheme(final BuildContext context) {
    return Theme.of(context).textTheme;
  }
}

class _SpecialRadioListTile extends RadioListTile<TwoRadioState> {
  _SpecialRadioListTile({
    required final String title,
    required final TextTheme textTheme,
    required final TwoRadioState value,
    required final TwoRadioState? groupValue,
    required final void Function(TwoRadioState?)? onChanged,
  }) : super(
          title: Text(
            title,
            style: textTheme.bodyMedium,
          ), // TODO Remove textTheme, but also fix all form headers
          value: value,
          groupValue: groupValue,
          onChanged: onChanged,
          visualDensity: const VisualDensity(
            horizontal: VisualDensity.minimumDensity,
            vertical: VisualDensity.minimumDensity,
          ),
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          contentPadding: EdgeInsets.zero,
        );
}

String? _defaultValidator(final TwoRadioState? value) {
  print('VALIDATION $value');
  if (value == null || value == TwoRadioState.nothing) {
    return 'error_nothing_chosen_two_radio'.tr();
  } else {
    return null;
  }
}
