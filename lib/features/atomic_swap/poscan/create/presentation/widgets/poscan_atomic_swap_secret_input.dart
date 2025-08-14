import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:threedpass/core/utils/validators.dart';
import 'package:threedpass/core/widgets/input/textformfield/textformfield.dart';
import 'package:threedpass/features/common/form_option/form_field_card.dart';
import 'package:threedpass/features/common/form_option/obscure_text_field.dart';

class PoscanAtomicSwapSecretInput extends StatefulWidget {
  const PoscanAtomicSwapSecretInput({
    required this.secretController,
    required this.proofController,
    super.key,
  });

  final TextEditingController secretController;
  final TextEditingController proofController;

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<PoscanAtomicSwapSecretInput> {
  @override
  Widget build(final BuildContext context) {
    return FormFieldCard(
      fieldName: 'Swap secret', // TODO Localize
      child: Column(
        spacing: 16,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          D3pTextFormField(
            labelText: 'input_secret_create_atomic_swap_result'.tr(),
            hintText: 'Hashed proof will be displayed here',
            makeLabelOutside: true,
            readOnly: true,
            enabled: false,
            controller: widget.proofController,
            maxLines: 3,
          ),
          ObscureTextField(
            controller: widget.secretController,
            labelText: 'input_secret_create_atomic_swap'.tr(),
            hint: 'Enter secret',
            isLabelOutside: true,
            validator: Validators.notEmpty,
          ),
        ],
      ),
    );
  }
}
