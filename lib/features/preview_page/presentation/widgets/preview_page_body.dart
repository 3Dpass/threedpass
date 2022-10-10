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
        const SizedBox8(),
        MatchesFound(
          state: previewPageCubitState,
        ),
        const SizedBox8(),
        ObjectPreview(
          snapshot: previewPageCubitState.snapshot,
        ),
        const SizedBox16(),
        StableHashText(
          state: previewPageCubitState,
        ),
        const SizedBox16(),
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
        const SizedBox16(),
        MoreInfo(
          state: previewPageCubitState,
        ),
      ],
    );
  }
}
