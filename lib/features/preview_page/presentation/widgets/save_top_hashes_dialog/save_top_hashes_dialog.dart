import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:threedpass/core/widgets/buttons/text_button.dart';
import 'package:threedpass/core/widgets/dialog/d3p_platform_dialog.dart';
import 'package:threedpass/features/hashes_list/presentation/widgets/hashes_primitive_list.dart';
import 'package:threedpass/features/preview_page/bloc/preview_page_cubit.dart';

@RoutePage()
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
    return D3pPlatformDialog(
      title: 'top_10_hashes'.tr(),
      content: SingleChildScrollView(
        child: HashesPrimitiveList(
          hashesModel: pageCubitState.snapshot,
        ),
      ),
      actions: <Widget>[
        D3pTextButton(
          text: 'Cancel'.tr(),
          onPressed: () => context.router.pop(),
        ),
        D3pTextButton(
          text: 'Share'.tr(),
          onPressed: () => shareSnapshots(context),
        ),
        // _SaveTopHashesButton(pageCubitState),
      ],
    );
  }
}
