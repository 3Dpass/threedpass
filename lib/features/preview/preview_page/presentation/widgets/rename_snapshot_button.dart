import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:threedpass/core/widgets/d3p_card.dart';
import 'package:threedpass/core/widgets/other/padding_16.dart';
import 'package:threedpass/features/preview/preview_page/bloc/preview_page_cubit.dart';
import 'package:threedpass/features/settings_page/presentation/widgets/default_settings_button.dart';
import 'package:threedpass/router/router.gr.dart';

class RenameSnapshotButton extends StatelessWidget {
  const RenameSnapshotButton({required this.state, super.key});

  final PreviewPageCubitState state;

  @override
  Widget build(final BuildContext context) {
    if (state.psType == PreviewSnapshotType.existingSnapshot) {
      final theme = Theme.of(context);
      return Padding16(
        child: LineButton(
          icon: Icon(
            Icons.abc_rounded,
            color: theme.colorScheme.onSurface,
          ),
          localization_key: 'rename_this_snapshot_button_label',
          goToBasicRight: LineButtonRightValue(
            chevronColor: theme.colorScheme.onSurface,
            value: '',
          ),
          onBasePressed: () => context.router.push(
            RenameSnapshotRoute(
              snapshot: state.snapshot,
              hashObject: state.hashObject!,
            ),
          ),
          cardShape: CardShape.top,
        ),
      );
    } else {
      return const SizedBox();
    }
  }
}
