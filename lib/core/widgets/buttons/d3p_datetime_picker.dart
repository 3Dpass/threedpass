import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:threedpass/core/widgets/buttons/secondary_button.dart';
import 'package:threedpass/router/router.gr.dart';

class D3pDatetimePicker extends FormField<DateTime> {
  D3pDatetimePicker({
    // required final (String, String) label,
    // required final String titleKey,
    // final TwoRadioState? value = TwoRadioState.nothing,
    final String? Function(DateTime?)? validator,
    final void Function(DateTime)? onDone,
    super.key,
  }) : super(
          initialValue: null,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: validator,
          builder: (final FormFieldState<DateTime> state) {
            final text =
                state.value == null ? 'Choose date' : state.value.toString();

            return D3pSecondaryButton(
              localizedTextKey: text,
              onPressed: () => onPressed(state, onDone),
            );
          },
        );

  static void onPressed(
    final FormFieldState<DateTime> state,
    final void Function(DateTime)? onChanged,
  ) {
    final initialDateTime = state.value ?? DateTime.now();
    final lastDate = initialDateTime.add(Duration(days: 365));
    // final locale = Localizations.localeOf(state.context);
    state.context.router.push(
      ChooseDateTimeRoute(
        initialDate: initialDateTime,
        firstDate: initialDateTime,
        lastDate: lastDate,
        onDone: (p0) {
          state.didChange(p0);
          onChanged?.call(p0);
        },
      ),
    );
  }
}
