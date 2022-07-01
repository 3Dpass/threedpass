import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:threedpass/common/button_styles.dart';
import 'package:threedpass/features/result_page/presentation/bloc/preview_page_cubit.dart';
import 'package:threedpass/router/router.dart';

class PreviewSaveButton extends StatelessWidget {
  const PreviewSaveButton({
    Key? key,
    required this.state,
  }) : super(key: key);

  final PreviewPageCubitState state;

  String get title {
    switch (state.runtimeType) {
      case PreviewNewObject:
        return 'Save this object';
      case PreviewNewSnapshot:
        return 'Save this snapshot';
      case PreviewExistingSnapshot:
        return 'Rename this snapshot';
      default:
        return 'Error';
    }
  }

  PageRouteInfo get routeToPush {
    switch (state.runtimeType) {
      case PreviewNewObject:
        return SaveObjectDialogRoute(
          snapshot: state.snapshot,
        );
      case PreviewNewSnapshot:
        return SaveHashDialogRoute(
          hashObject: state.hashObject!,
          hashesModelToSave: state.snapshot,
        );
      case PreviewExistingSnapshot:
        return RenameSnapshotDialogRoute(
          hashObject: state.hashObject!,
          hashesModelToSave: state.snapshot,
        );
      default:
        throw Exception('Unknown state type');
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: AppButtonStyles.primaryButton,
      child: Text(title),
      onPressed: () => routeToPush.show(context),
    );
  }
}
