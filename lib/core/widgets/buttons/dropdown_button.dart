import 'package:flutter/material.dart';
import 'package:threedpass/core/theme/d3p_dropdown_theme.dart';
import 'package:threedpass/core/theme/d3p_special_colors.dart';
import 'package:threedpass/core/theme/d3p_special_styles.dart';

// ignore: prefer-single-widget-per-file
class D3pDropdownButton<T> extends DropdownButtonFormField<T> {
  D3pDropdownButton({
    required final BuildContext context,
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
          dropdownColor: Theme.of(context).customColors.scaffoldBackground,
          hint: Text(
            hint ?? '',
            style: Theme.of(context).customTextStyles.textInputHintStyle,
          ),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(horizontal: 8),
            filled: true,
            border: D3pDropdownTheme.border,
            focusedBorder: D3pDropdownTheme.focusedBorder,
          ),
        );
}
