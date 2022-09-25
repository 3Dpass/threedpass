part of '../save_object_dialog.dart';

class _SnapshotNameInput extends StatelessWidget {
  const _SnapshotNameInput(this.snapshotNameController);

  final TextEditingController snapshotNameController;
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        label: Text('create_object_snap_input_label'.tr()),
        hintText: 'create_object_snap_input_hint'.tr(),
        isCollapsed: false,
      ),
      controller: snapshotNameController,
    );
  }
}
