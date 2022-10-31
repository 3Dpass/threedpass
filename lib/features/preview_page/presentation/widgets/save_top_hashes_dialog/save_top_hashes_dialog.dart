import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:threedpass/features/hashes_list/presentation/widgets/hashes_primitive_list.dart';
import 'package:threedpass/features/preview_page/bloc/preview_page_cubit.dart';
import 'package:threedpass/router/router.gr.dart';

part 'save_top_hashes_button.dart';

class SaveTopHashesDialog extends StatelessWidget {
  const SaveTopHashesDialog({
    required this.pageCubitState,
    final Key? key,
  }) : super(key: key);

  final PreviewPageCubitState pageCubitState;

  void shareSnapshots(final BuildContext context) {
    context.router.pop();
    Share.share(pageCubitState.snapshot.shareText);
  }

  @override
  Widget build(final BuildContext context) {
    return AlertDialog(
      title: Text('top_10_hashes'.tr()),
      content: SingleChildScrollView(
        child: HashesPrimitiveList(
          hashesModel: pageCubitState.snapshot,
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: Text('Cancel'.tr()),
          onPressed: () => context.router.pop(),
        ),
        TextButton(
          child: Text('Share'.tr()),
          onPressed: () => shareSnapshots(context),
        ),
        // _SaveTopHashesButton(pageCubitState),
      ],
    );
  }
}
