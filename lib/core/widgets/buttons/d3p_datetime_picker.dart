import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:threedpass/core/utils/formatters.dart';
import 'package:threedpass/core/widgets/buttons/secondary_button.dart';
import 'package:threedpass/router/router.gr.dart';

class D3pDatetimePicker extends FormField<DateTime> {
  D3pDatetimePicker({
    final String? Function(DateTime?)? validator = _isNotEmpty,
    final void Function(DateTime)? onDone,
    super.key,
  }) : super(
          initialValue: null,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: validator,
          builder: (final FormFieldState<DateTime> state) {
            final theme = Theme.of(state.context);
            final bt = buttonText(state);

            return D3pSecondaryButton(
              localizedTextKey: bt.$1,
              onPressed: () => onPressed(state, onDone),
              translate: bt.$2,
              color: state.hasError ? theme.colorScheme.error : null,
            );
          },
        );

  static (String, bool) buttonText(
    final FormFieldState<DateTime> state,
  ) {
    final dateTime = state.value;
    if (state.hasError && dateTime == null) {
      return ('no_date_time_chosen', true);
    } else if (state.hasError) {
      return ('date_time_picker_error', true);
    }

    if (dateTime == null) {
      return ('open_date_time_picker', true);
    } else {
      return (Formatters.shortDateFormat.format(dateTime), false);
    }
  }

  static void onPressed(
    final FormFieldState<DateTime> state,
    final void Function(DateTime)? onChanged,
  ) {
    final initialDateTime = state.value ?? DateTime.now();
    // final locale = Localizations.localeOf(state.context);
    state.context.router.push(
      ChooseDateTimeRoute(
        initialDate: initialDateTime,
        firstDate: initialDateTime,
        lastDate: null,
        onDone: (p0) {
          state.didChange(p0);
          onChanged?.call(p0);
        },
      ),
    );
  }
}

String? _isNotEmpty(p0) => p0 != null ? null : 'no_date_chosen_validator'.tr();
