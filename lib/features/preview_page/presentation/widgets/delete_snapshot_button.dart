import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:threedpass/core/widgets/d3p_card.dart';
import 'package:threedpass/features/preview_page/bloc/preview_page_cubit.dart';
import 'package:threedpass/features/settings_page/presentation/widgets/default_settings_button.dart';
import 'package:threedpass/router/router.gr.dart';

class DeleteSnapshotButton extends StatelessWidget {
  const DeleteSnapshotButton({
    required this.state,
    final Key? key,
  }) : super(key: key);

  final PreviewPageCubitState state;

  @override
  Widget build(final BuildContext context) {
    final cardShape = !state.isNew ? CardShape.bottom : CardShape.all;

    final text =
        state.isNew ? 'delete_new_snapshot' : 'delete_extisting_snapshot';

    return DefaultSettingsButton.openButton(
      iconData: Icons.delete_outline_rounded,
      iconColor: Colors.red,
      textValue: '',
      onPressed: state.isNew
          ? () => context.router.pop()
          : () => context.router
              .push(DeleteSnapshotRoute(popGlobal: context.router.pop)),
      text: text,
      cardShape: cardShape,
      isChevronGrey: false,
    );
  }
}
