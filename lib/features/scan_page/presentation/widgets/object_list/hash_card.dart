import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:threedpass/core/theme/d3p_special_styles.dart';
import 'package:threedpass/core/widgets/d3p_card.dart';
import 'package:threedpass/core/widgets/text/d3p_body_large_text.dart';
import 'package:threedpass/features/hashes_list/domain/entities/hash_object.dart';
import 'package:threedpass/features/hashes_list/domain/entities/snapshot.dart';
import 'package:threedpass/features/scan_page/presentation/widgets/object_list/hash_card_popup_menu.dart';
import 'package:threedpass/features/settings_page/presentation/widgets/settings_text.dart';
import 'package:threedpass/router/router.gr.dart';

class SnapshotCard extends StatelessWidget {
  SnapshotCard({
    required this.snapshot,
    required this.hashObject,
    final Key? key,
  }) : super(key: key);

  final DateFormat formatter = DateFormat('yyyy-MM-dd H:m:s');
  final Snapshot snapshot;
  final HashObject hashObject;

  @override
  Widget build(final BuildContext context) {
    final textStyles = Theme.of(context).customTextStyles;
    return D3pCard(
      child: InkWell(
        onTap: () => context.router.push(
          PreviewWrapperRoute(
            hashObject: hashObject,
            snapshot: snapshot,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Flexible(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Flexible(
                      child: D3pBodyLargeText(
                        'snap_card_name'.tr() + snapshot.name,
                      ),
                    ),
                    D3pBodyLargeText(
                      'snap_card_stamp'.tr() + formatter.format(snapshot.stamp),
                    ),
                    const SizedBox(height: 8),
                    Text.rich(snapshot.settingsConfig.toText(context)),
                  ],
                ),
              ),
              HashCardPopUpMenuButton(
                hashObject: hashObject,
                snapshot: snapshot,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
