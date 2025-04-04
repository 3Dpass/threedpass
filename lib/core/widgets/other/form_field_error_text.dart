import 'package:flutter/material.dart';

class FormFieldErrorText extends StatelessWidget {
  final FormFieldState state;

  FormFieldErrorText(this.state);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    if (state.hasError) {
      return Text(
        state.errorText ?? '',
        style: textTheme.bodyMedium!.copyWith(
          color: Theme.of(state.context).colorScheme.error,
        ),
      );
    } else {
      return SizedBox();
    }
  }
}
