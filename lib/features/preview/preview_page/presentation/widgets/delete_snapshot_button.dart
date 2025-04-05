import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:threedpass/core/widgets/d3p_card.dart';
import 'package:threedpass/core/widgets/other/padding_16.dart';
import 'package:threedpass/features/hashes_list/domain/entities/snapshot.dart';
import 'package:threedpass/features/settings_page/presentation/widgets/default_settings_button.dart';
import 'package:threedpass/router/router.gr.dart';

class DeleteSnapshotButton extends StatelessWidget {
  const DeleteSnapshotButton({
    required this.state,
    final Key? key,
  }) : super(key: key);

  final Snapshot state;

  @override
  Widget build(final BuildContext context) {
    final theme = Theme.of(context);

    return Padding16(
      child: LineButton(
        icon: Icon(
          Icons.delete_outline_rounded,
          color: theme.colorScheme.error,
        ),
        localization_key: 'delete_extisting_snapshot',
        goToBasicRight: LineButtonRightValue(
          chevronColor: theme.colorScheme.onSurface,
          value: '',
        ),
        onBasePressed: state.isNew
            ? () => context.router.maybePop()
            : () => context.router.push(const DeleteSnapshotRoute()),
        cardShape: CardShape.bottom,
      ),
    );
  }
}
