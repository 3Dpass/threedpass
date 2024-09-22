import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:threedpass/core/utils/extrinsic_show_loading_mixin.dart';
import 'package:threedpass/core/widgets/buttons/elevated_button.dart';

class SomeFormSubmitButton extends StatelessWidget {
  const SomeFormSubmitButton({
    required this.extrinsicMixin,
    this.isActive = true,
    super.key,
  });

  final ExtrinsicShowLoadingMixin<dynamic, dynamic> extrinsicMixin;
  final bool isActive;

  @override
  Widget build(final BuildContext context) {
    return D3pElevatedButton(
      text: 'sign_extrinsic'.tr(),
      onPressed:
          isActive ? () async => extrinsicMixin.submitExtrinsic(context) : null,
    );
  }
}
