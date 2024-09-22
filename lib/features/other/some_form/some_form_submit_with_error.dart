import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:threedpass/core/theme/d3p_special_styles.dart';
import 'package:threedpass/core/utils/extrinsic_show_loading_mixin.dart';
import 'package:threedpass/features/other/some_form/some_form_submit_button.dart';

class SomeFormSubmitWithErrorButton extends StatelessWidget {
  const SomeFormSubmitWithErrorButton({
    required this.extrinsicMixin,
    required this.unlocalizedError,
    this.isActive = true,
    super.key,
  });

  final ExtrinsicShowLoadingMixin<dynamic, dynamic> extrinsicMixin;
  final bool isActive;
  final String unlocalizedError;

  @override
  Widget build(final BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (unlocalizedError.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Text(
              unlocalizedError.tr(),
              style: Theme.of(context).customTextStyles.errorMedium,
            ),
          ),
        SomeFormSubmitButton(
          extrinsicMixin: extrinsicMixin,
          isActive: isActive,
        ),
      ],
    );
  }
}
