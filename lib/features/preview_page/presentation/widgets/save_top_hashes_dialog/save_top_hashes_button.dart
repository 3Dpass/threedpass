part of 'save_top_hashes_dialog.dart';

class _SaveTopHashesButton extends StatelessWidget {
  const _SaveTopHashesButton(this.pageCubitState);

  final PreviewPageCubitState pageCubitState;

  void openSaveDialog(BuildContext context) {
    // For some reason it's not possible to place context.router.replace outsite conditional op?
    pageCubitState.hashObject != null
        ? context.router.replace(
            SaveHashDialogRoute(
              snapshot: pageCubitState.snapshot,
              hashObject: pageCubitState.hashObject!,
            ),
          )
        : context.router.replace(
            SaveObjectDialogRoute(
              snapshot: pageCubitState.snapshot,
            ),
          );
  }

  @override
  Widget build(BuildContext context) {
    if (pageCubitState is PreviewExistingSnapshot) {
      return TextButton(
        child: Text('Saved'.tr()),
        onPressed: null,
      );
    } else {
      return TextButton(
        child: Text('Save'.tr()),
        onPressed: () => openSaveDialog(context),
      );
    }
  }
}
