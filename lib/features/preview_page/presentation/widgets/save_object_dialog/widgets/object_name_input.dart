part of '../save_object_dialog.dart';

class _ObjectNameInput extends StatelessWidget {
  const _ObjectNameInput(this.objectNameController);

  final TextEditingController objectNameController;
  @override
  Widget build(final BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        label: Text('create_object_input_label'.tr()),
        hintText: 'create_object_input_hint'.tr(),
        isCollapsed: false,
      ),
      controller: objectNameController,
    );
  }
}
