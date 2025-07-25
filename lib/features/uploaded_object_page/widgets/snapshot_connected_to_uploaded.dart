import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';
import 'package:threedpass/features/hashes_list/domain/entities/snapshot.dart';
import 'package:threedpass/features/other/link_to_page/entities/link_to_page_params.dart';
import 'package:threedpass/features/other/link_to_page/ui/basic_links_list.dart';
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
      items: snapshots.map<LinkToPageParams>((final snapshot) {
        return LinkToPageParams(
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
