import 'package:flutter/material.dart';
import 'package:threedpass/core/theme/d3p_dropdown_theme.dart';

// ignore: prefer-single-widget-per-file
class D3pDropdownButton<T> extends DropdownButtonFormField<T> {
  D3pDropdownButton({
    required super.items,
    required super.onChanged,
    required super.value,
    // required final String label,
    super.isExpanded,
    super.key,
    super.selectedItemBuilder,
    super.validator,
    final String? hint,
  }) : super(
          // dropdownColor: Theme.of(context).scaffoldBackgroundColor,
          hint: Text(hint ?? ''),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(horizontal: 8),
            filled: true,
            border: D3pDropdownTheme.border,
            focusedBorder: D3pDropdownTheme.focusedBorder,
          ),
        );
}
