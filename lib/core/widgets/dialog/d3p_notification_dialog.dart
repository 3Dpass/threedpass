import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:threedpass/core/widgets/buttons/text_button.dart';
import 'package:threedpass/core/widgets/dialog/d3p_platform_dialog.dart';
import 'package:threedpass/core/widgets/text/d3p_body_medium_text.dart';
import 'package:threedpass/router/router.dart';
import 'package:threedpass/router/router.gr.dart';

@RoutePage(name: 'NotificationDialogRoute')
class D3pNotificationDialog extends StatelessWidget {
  final String title;
  final String message;

  D3pNotificationDialog({
    super.key,
    required this.title,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return D3pPlatformDialog(
      title: title,
      content: D3pBodyMediumText(message),
      actions: [
        D3pTextButton(
          text: 'OK'.tr(),
          onPressed: () => context.router.maybePop(),
        ),
      ],
    );
  }
}

final AutoRoute notificationRoute = CustomRoute(
  page: NotificationDialogRoute.page,
  customRouteBuilder: dialogBuilder,
);
