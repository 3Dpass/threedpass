import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/widgets/other/padding_16.dart';
import 'package:threedpass/core/widgets/paddings.dart';
import 'package:threedpass/features/legacy_preview/preview_from_file.dart';
import 'package:threedpass/features/preview/preview_page/bloc/preview_page_cubit.dart';
import 'package:threedpass/features/preview/preview_page/presentation/widgets/delete_snapshot_button.dart';
import 'package:threedpass/features/preview/preview_page/presentation/widgets/deprecation_warning.dart';
import 'package:threedpass/features/preview/preview_page/presentation/widgets/explore_hashes_button.dart';
import 'package:threedpass/features/preview/preview_page/presentation/widgets/file_hash_card.dart';
import 'package:threedpass/features/preview/preview_page/presentation/widgets/hash_properties.dart';
import 'package:threedpass/features/preview/preview_page/presentation/widgets/poscan_result.dart';
import 'package:threedpass/features/preview/preview_page/presentation/widgets/rename_object_button.dart';
import 'package:threedpass/features/preview/preview_page/presentation/widgets/rename_snapshot_button.dart';
import 'package:threedpass/features/preview/preview_page/presentation/widgets/section_title.dart';
import 'package:threedpass/features/preview/preview_page/presentation/widgets/snapshot_info.dart';
import 'package:threedpass/features/preview/preview_page/presentation/widgets/stable_hashes_section.dart';
import 'package:threedpass/features/preview/preview_page/presentation/widgets/top_hashes_card.dart';
import 'package:threedpass/features/preview/preview_page/presentation/widgets/top_hashes_title.dart';

class PreviewPageBody extends StatelessWidget {
  const PreviewPageBody({
    // required this.previewPageCubitState,
    super.key,
  });

  // final PreviewPageCubitState previewPageCubitState;

  static const double objectPreviewHeight = 250.0;

  @override
  Widget build(final BuildContext context) {
    final ppc = BlocProvider.of<PreviewPageCubit>(context);
    final snapshot = ppc.state;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const H16(),
        const DeprecationWarning(),
        const SnapshotInfo(),
        PreviewFromFile(
          size: Size(MediaQuery.of(context).size.width, objectPreviewHeight),
          zoom: 1.0,
          path: snapshot.realPath,
          // scale: (objectPreviewHeight - 32) / 2,
        ),

        const StableHashesSection(),
        const SizedBox(height: 2),
        const ExploreHashesButton(),
        const H16(),
        const SectionTitle(titleUnlocalized: 'settings_text_span_title'),
        ScanProperties(
          snapshot: snapshot,
        ),
        const H16(),
        const FileHashBlock(),
        const H16(),
        const SectionTitle(titleUnlocalized: 'poscan_object_title'),
        const PoscanResult(),
        const H16(),
        const TopHashesTitle(),
        const SizedBox(height: 2),
        TopHashesCard(hashes: snapshot.hashes),
        const H16(),
        const RenameSnapshotButton(),
        DeleteSnapshotButton(state: snapshot),
        const H16(),
        const Padding16(
          child: Divider(),
        ),
        const RenameObjectButton(),
        // const ScanOneMoreTimeButton(),
        const H16(),
      ],
    );
  }
}
