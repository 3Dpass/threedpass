import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:threedpass/core/widgets/buttons/text_button.dart';
import 'package:threedpass/features/hashes_list/domain/entities/snapshot.dart';
import 'package:threedpass/router/router.gr.dart';

class SnapshotConnectedToUploaded extends StatelessWidget {
  const SnapshotConnectedToUploaded({
    required this.snapshots,
    super.key,
  });

  final Iterable<Snapshot> snapshots;

  @override
  Widget build(final BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: snapshots.map<Widget>((final snapshot) {
        return D3pTextButton(
          text: 'View ${snapshot.name}',
          onPressed: () async => context.router.push(
            PreviewRouteWrapper(
              snapshot: snapshot,
            ),
          ),
        );
      }).toList(),
    );
  }
}
