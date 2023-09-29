import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:threedpass/core/theme/d3p_special_styles.dart';
import 'package:threedpass/router/router.gr.dart';

class RecieveButton extends StatelessWidget {
  const RecieveButton({final Key? key}) : super(key: key);

  void onPressed(final BuildContext context) {
    context.router.push(const RecieveRoute());
  }

  @override
  Widget build(final BuildContext context) {
    final style = Theme.of(context).customTextStyles.d3pFloatingButton;

    return FloatingActionButton.extended(
      icon: const Icon(Icons.arrow_downward_rounded),
      label: Text(
        'recieve_coins_button_label'.tr(),
        style: style,
      ),
      onPressed: () => onPressed(context),
    );
  }
}
