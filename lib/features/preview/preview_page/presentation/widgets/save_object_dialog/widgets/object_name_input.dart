part of '../save_object_dialog.dart';

class _ObjectNameInput extends StatelessWidget {
  const _ObjectNameInput(this.objectNameController);

  final TextEditingController objectNameController;
  @override
  Widget build(final BuildContext context) {
    return D3pTextFormField(
      labelText: 'create_object_input_label'.tr(),
      hintText: 'create_object_input_hint'.tr(),
      isCollapsed: false,
      controller: objectNameController,
      validator: Validators.notEmpty,
    );
  }
}
