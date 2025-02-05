import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:threedpass/core/utils/auto_route_getter.dart';
import 'package:threedpass/core/widgets/buttons/secondary_button.dart';
import 'package:threedpass/core/widgets/dialog/d3p_choose_datetime_modal.dart';
import 'package:threedpass/router/router.gr.dart';

class D3pDatetimePicker extends FormField<DateTime> {
  D3pDatetimePicker({
    // required final (String, String) label,
    // required final String titleKey,
    // final TwoRadioState? value = TwoRadioState.nothing,
    final String? Function(DateTime?)? validator,
    final void Function(DateTime)? onChanged,
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
              onPressed: () => onPressed(state),
            );
          },
        );

  static void onPressed(final FormFieldState<DateTime> state) {
    final initialDateTime = state.value ?? DateTime.now();
    final lastDate = initialDateTime.add(Duration(days: 365));
    // final locale = Localizations.localeOf(state.context);
    state.context.router.push(
      ChooseDateTimeRoute(
        initialDate: initialDateTime,
        firstDate: initialDateTime,
        lastDate: lastDate,
      ),
    );
    // show(
    //   context: state.context,
    //   initialDate: initialDateTime,
    //   firstDate: initialDateTime,
    //   lastDate: lastDate,
    //   locale: locale,
    // );
    // showCupertinoModalPopup(
    //   context: state.context,
    //   builder: (_) => Container(
    //     height: 300,
    //     padding: const EdgeInsets.only(top: 10),
    //     color: Colors.white,
    //     child: Column(
    //       mainAxisSize: MainAxisSize.min,
    //       children: [
    //         SizedBox(
    //           height: 250,
    //           child: CupertinoDatePicker(
    //             mode: CupertinoDatePickerMode.dateAndTime,
    //             onDateTimeChanged: (DateTime newDate) {},
    //             initialDateTime: initialDateTime,
    //           ),
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }
}
