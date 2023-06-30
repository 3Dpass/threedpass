import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:threedpass/core/widgets/buttons/text_button.dart';
import 'package:threedpass/core/widgets/dialog/d3p_platform_dialog.dart';
import 'package:threedpass/core/widgets/text/d3p_body_medium_text.dart';

@RoutePage()
class NoStableHashDialog extends StatelessWidget {
  const NoStableHashDialog({super.key});

  @override
  Widget build(final BuildContext context) {
    return D3pPlatformDialog(
      title: 'no_stable_hash_dialog_title'.tr(),
      content: const D3pBodyMediumText('no_stable_hash_dialog_text'),
      actions: [
        D3pTextButton(
          text: 'OK'.tr(),
          onPressed: () => context.router.pop(),
        ),
      ],
    );
  }
}
