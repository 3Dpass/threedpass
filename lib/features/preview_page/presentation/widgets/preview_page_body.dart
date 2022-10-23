part of '../preview_page.dart';

class PreviewPageBody extends StatelessWidget {
  const PreviewPageBody({
    required this.previewPageCubitState,
    final Key? key,
  }) : super(key: key);

  final PreviewPageCubitState previewPageCubitState;

  @override
  Widget build(final BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Flexible(
          child: SnapshotInfo(
            state: previewPageCubitState,
          ),
        ),
        const SizedBoxH8(),
        MatchesFound(
          state: previewPageCubitState,
        ),
        const SizedBoxH8(),
        ObjectPreview(
          snapshot: previewPageCubitState.snapshot,
        ),
        const SizedBoxH16(),
        StableHashText(
          state: previewPageCubitState,
        ),
        const SizedBoxH16(),
        HashProperties(
          snapshot: previewPageCubitState.snapshot,
        ),
        PreviewSaveButton(
          state: previewPageCubitState,
        ),
        const SizedBox(height: 4),
        DeleteSnapshotButton(
          snapshot: previewPageCubitState.snapshot,
          hashObject: previewPageCubitState.hashObject,
        ),
        const SizedBoxH16(),
        MoreInfo(
          state: previewPageCubitState,
        ),
      ],
    );
  }
}
