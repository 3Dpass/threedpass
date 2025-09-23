import 'package:flutter/material.dart';

class FormFieldErrorText extends StatelessWidget {
  final FormFieldState state;
  final double pt;
  final double pl;

  const FormFieldErrorText(
    this.state, {
    this.pt = 0,
    this.pl = 0,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    if (state.hasError) {
      return Padding(
        padding: EdgeInsets.only(top: pt, left: pl),
        child: Text(
          state.errorText ?? '',
          style: textTheme.bodySmall!.copyWith(
            color: Theme.of(state.context).colorScheme.error,
          ),
        ),
      );
    } else {
      return SizedBox();
    }
  }
}
