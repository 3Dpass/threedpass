import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:threedpass/core/widgets/d3p_scaffold.dart';
import 'package:threedpass/features/wallet_screen/presentation/notifications_page/widgets/notifications_list.dart';

@RoutePage()
class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(final BuildContext context) {
    return const D3pScaffold(
      body: NotificationsList(),
      appbarTitle: 'notifications_titile',
    );
  }
}
