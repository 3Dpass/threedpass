import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/features/preview_page/bloc/preview_page_cubit.dart';
import 'package:threedpass/features/preview_page/presentation/widgets/appbar/preview_appbar.dart';
import 'package:threedpass/features/preview_page/presentation/widgets/object_preview.dart';
import 'package:threedpass/features/preview_page/presentation/widgets/delete_snapshot_button.dart';
import 'package:threedpass/features/preview_page/presentation/widgets/hash_properties.dart';
import 'package:threedpass/features/preview_page/presentation/widgets/matches_found/matches_found.dart';
import 'package:threedpass/features/preview_page/presentation/widgets/more_info.dart';
import 'package:threedpass/features/preview_page/presentation/widgets/preview_save_button.dart';
import 'package:threedpass/features/preview_page/presentation/widgets/snapshot_info.dart';

class PreviewPage extends StatelessWidget {
  const PreviewPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final previewPageCubitState =
        BlocProvider.of<PreviewPageCubit>(context).state;

    return Scaffold(
      appBar: PreviewAppBar(
        hashObject: previewPageCubitState.hashObject,
        snapshot: previewPageCubitState.snapshot,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 16),
            Flexible(
              child: SnapshotInfo(
                state: previewPageCubitState,
              ),
            ),
            const SizedBox(height: 8),
            MatchesFound(
              state: previewPageCubitState,
            ),
            const SizedBox(height: 8),
            ObjectPreview(
              snapshot: previewPageCubitState.snapshot,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16, bottom: 16),
              child: HashProperties(
                snapshot: previewPageCubitState.snapshot,
              ),
            ),
            PreviewSaveButton(
              state: previewPageCubitState,
            ),
            const SizedBox(height: 4),
            DeleteSnapshotButton(
              snapshot: previewPageCubitState.snapshot,
              hashObject: previewPageCubitState.hashObject,
            ),
            const Padding(padding: EdgeInsets.only(top: 16)),
            MoreInfo(
              state: previewPageCubitState,
            ),
          ],
        ),
      ),
    );
  }
}
