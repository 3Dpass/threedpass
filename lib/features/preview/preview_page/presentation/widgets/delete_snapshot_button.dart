import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:threedpass/core/widgets/d3p_card.dart';
import 'package:threedpass/core/widgets/other/padding_16.dart';
import 'package:threedpass/features/preview/preview_page/bloc/preview_page_cubit.dart';
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
    final text =
        state.isNew ? 'delete_new_snapshot' : 'delete_extisting_snapshot';

    final theme = Theme.of(context);

    return Padding16(
      child: LineButton(
        icon: Icon(
          Icons.delete_outline_rounded,
          color: theme.colorScheme.error,
        ),
        localization_key: text,
        goToBasicRight: LineButtonRightValue(
          chevronColor: theme.colorScheme.onSurface,
          value: '',
        ),
        onBasePressed: state.isNew
            ? () => context.router.pop()
            : () => context.router.push(const DeleteSnapshotRoute()),
        cardShape: CardShape.bottom,
      ),
    );
  }
}
