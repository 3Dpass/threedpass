import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:threedpass/core/widgets/buttons/elevated_button.dart';
import 'package:threedpass/core/widgets/other/padding_16.dart';
import 'package:threedpass/features/preview_page/bloc/preview_page_cubit.dart';
import 'package:threedpass/router/router.gr.dart';

class PreviewSaveButton extends StatelessWidget {
  const PreviewSaveButton({
    required this.state,
    final Key? key,
  }) : super(key: key);

  final PreviewPageCubitState state;

  String get title {
    switch (state.runtimeType) {
      case PreviewNewObject:
        return 'save_this_object_button_label'.tr();
      case PreviewNewSnapshot:
        return 'save_this_snapshot_button_label'.tr();
      case PreviewExistingSnapshot:
      default:
        return 'Error';
    }
  }

  PageRouteInfo get routeToPush {
    switch (state.runtimeType) {
      case PreviewNewObject:
        return SaveObjectRoute(
          snapshot: state.snapshot,
        );
      case PreviewNewSnapshot:
        return SaveHashRoute(
          hashObject: state.hashObject!,
          snapshot: state.snapshot,
        );
      case PreviewExistingSnapshot:
      default:
        throw Exception('Unknown state type');
    }
  }

  @override
  Widget build(final BuildContext context) {
    if (state.psType == PreviewSnapshotType.newObject ||
        state.psType == PreviewSnapshotType.newSnapshot) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: Padding16(
          child: D3pElevatedButton(
            iconData: Icons.save,
            text: title,
            onPressed: () => routeToPush.push<void>(context),
          ),
        ),
      );
    } else {
      return const SizedBox();
    }
  }
}
