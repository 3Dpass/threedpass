import 'package:flutter/material.dart';
import 'package:threedpass/core/widgets/paddings.dart';
import 'package:threedpass/features/preview_page/bloc/preview_page_cubit.dart';
import 'package:threedpass/features/preview_page/presentation/widgets/delete_snapshot_button.dart';
import 'package:threedpass/features/preview_page/presentation/widgets/hash_properties.dart';
import 'package:threedpass/features/preview_page/presentation/widgets/object_preview/object_preview.dart';
import 'package:threedpass/features/preview_page/presentation/widgets/poscan_result.dart';
import 'package:threedpass/features/preview_page/presentation/widgets/preview_save_button.dart';
import 'package:threedpass/features/preview_page/presentation/widgets/rename_snapshot_button.dart';
import 'package:threedpass/features/preview_page/presentation/widgets/show_hashes_button.dart';
import 'package:threedpass/features/preview_page/presentation/widgets/snapshot_info.dart';
import 'package:threedpass/features/preview_page/presentation/widgets/stable_hash_text.dart';
import 'package:threedpass/features/preview_page/presentation/widgets/top_hashes_card.dart';

// TODO Make different buttons for new and rename buttons
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
        const SizedBoxH16(),
        SnapshotInfo(
          state: previewPageCubitState,
        ),
        ObjectPreview(
          snapshot: previewPageCubitState.snapshot,
        ),
        // const SizedBoxH16(),
        PreviewSaveButton(
          state: previewPageCubitState,
        ),
        StableHashText(
          state: previewPageCubitState,
        ),
        const SizedBoxH8(),
        ScanProperties(
          snapshot: previewPageCubitState.snapshot,
        ),
        const SizedBoxH8(),

        const ExploreSnapshotsButton(),

        const SizedBoxH16(),

        const PoscanResult(),

        const SizedBoxH16(),

        TopHashesCard(state: previewPageCubitState),

        const SizedBoxH8(),

        RenameSnapshotButton(state: previewPageCubitState),
        DeleteSnapshotButton(state: previewPageCubitState),

        const SizedBoxH16(),
      ],
    );
  }
}
