import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/widgets/buttons/text_button.dart';
import 'package:threedpass/core/widgets/dialog/d3p_platform_dialog.dart';
import 'package:threedpass/features/poscan_putobject/bloc/poscan_putobject_cubit.dart';
import 'package:threedpass/features/poscan_putobject/domain/entities/poscan_property.dart';
import 'package:threedpass/features/poscan_putobject/presentation/widgets/property_max_value_input.dart';
import 'package:threedpass/features/poscan_putobject/utils/multiple_of_ten_property_validator.dart';

class EditPropertyDialog extends StatelessWidget {
  final TextEditingController _maxValueController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final PoscanProperty prop;

  EditPropertyDialog({required this.prop, final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    _maxValueController.text = prop.propValue.maxValue.toString();

    return D3pPlatformDialog(
      title: 'edit_action'
          .tr(args: [prop.name, prop.propValue.propIdx.toString()]),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            // Spacing between text fields
            Form(
              key: _formKey,
              child: Container(
                height: 70,
                child: PropertyMaxValueInputField(
                  controller: _maxValueController,
                  validationStrategy: MultipleOfTenPropertyValidator(),
                ),
              ),
            ),
          ],
        ),
      ),
      actions: <Widget>[
        D3pTextButton(
          text: 'Cancel'.tr(),
          onPressed: () => Navigator.of(context).pop(),
        ),
        D3pTextButton(
          text: 'edit_action_submit'.tr(),
          onPressed: () => _editProperty(context),
        ),
      ],
    );
  }

  void _editProperty(final BuildContext context) {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    final BigInt maxValue =
        BigInt.tryParse(_maxValueController.text) ?? BigInt.zero;
    BlocProvider.of<PoscanPutObjectCubit>(context)
        .editProp(prop.copyWith(maxValue: maxValue));
    Navigator.of(context).pop();
  }
}
