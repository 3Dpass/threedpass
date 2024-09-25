import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';
import 'package:threedpass/features/hashes_list/domain/entities/snapshot.dart';
import 'package:threedpass/features/uploaded_object_page/widgets/basic_links_list.dart';
import 'package:threedpass/router/router.gr.dart';

class SnapshotConnectedToUploaded extends StatelessWidget {
  const SnapshotConnectedToUploaded({
    required this.snapshots,
    super.key,
  });

  final Iterable<Snapshot> snapshots;

  @override
  Widget build(final BuildContext context) {
    return BasicLinksList(
      items: snapshots.map<LinkParams>((final snapshot) {
        return LinkParams(
          title: 'snapshot_link_text'.tr(args: [snapshot.name]),
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
