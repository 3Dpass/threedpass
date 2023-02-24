import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:threedpass/core/theme/d3p_special_colors.dart';
import 'package:threedpass/core/theme/d3p_special_styles.dart';

class D3pDropdownButton<T> extends DropdownButton<T> {
  D3pDropdownButton({
    required final BuildContext context,
    required super.items,
    required super.onChanged,
    required super.value,
    super.isExpanded,
    super.key,
    super.selectedItemBuilder,
  }) : super(
          dropdownColor: Theme.of(context).customColors.scaffoldBackground,
          style: Theme.of(context).customTextStyles.d3pBodyLarge,
        );
}

// ignore: prefer-single-widget-per-file
class D3pDropdownButtonFormField<T> extends DropdownButtonFormField<T> {
  D3pDropdownButtonFormField({
    required final BuildContext context,
    required super.items,
    required super.onChanged,
    required super.value,
    required final String label,
    super.isExpanded,
    super.key,
    super.selectedItemBuilder,
  }) : super(
          dropdownColor: Theme.of(context).customColors.scaffoldBackground,
          style: Theme.of(context).customTextStyles.d3pBodyLarge,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(horizontal: 8),
            label: Text(
              label.tr(),
              style: Theme.of(context).customTextStyles.d3pBodyMedium,
            ),
          ),
        );
}
