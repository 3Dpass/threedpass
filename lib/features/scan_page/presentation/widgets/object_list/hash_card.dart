import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';
import 'package:threedpass/core/theme/d3p_colors.dart';
import 'package:threedpass/core/theme/d3p_special_styles.dart';
import 'package:threedpass/core/utils/formatters.dart';
import 'package:threedpass/core/widgets/buttons/clickable_card.dart';
import 'package:threedpass/core/widgets/paddings.dart';
import 'package:threedpass/core/widgets/text/d3p_body_medium_text.dart';
import 'package:threedpass/features/hashes_list/bloc/hashes_list_bloc.dart';
import 'package:threedpass/features/hashes_list/domain/entities/hash_object.dart';
import 'package:threedpass/features/hashes_list/domain/entities/snapshot.dart';
import 'package:threedpass/features/scan_page/presentation/widgets/object_list/hash_card_popup_menu.dart';
import 'package:threedpass/features/settings_page/presentation/widgets/settings_text.dart';
import 'package:threedpass/router/router.gr.dart';

class SnapshotCard extends StatelessWidget {
  const SnapshotCard({
    required this.snapshot,
    required this.hashObject,
    final Key? key,
  }) : super(key: key);

  final Snapshot snapshot;
  final HashObject hashObject;

  @override
  Widget build(final BuildContext context) {
    final theme = Theme.of(context).customTextStyles;
    return ClickableCard(
      onTap: () => context.router.push(
        PreviewRouteWrapper(
          hashObject: hashObject,
          snapshot: snapshot,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Flexible(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  snapshot.name,
                  style: theme.d3pBodyLarge,
                ),
                const SizedBoxH8(),
                Text.rich(
                  snapshot.settingsConfig.toShort(context),
                ),
                const SizedBoxH8(),
                D3pBodyMediumText(
                  Fmt.basicDateFormat.format(snapshot.stamp),
                  translate: false,
                  color: D3pColors.disabled,
                ),
              ],
            ),
          ),
          HashCardPopUpMenuButton(
            hashObject: hashObject,
            snapshot: snapshot,
          ),
        ],
      ),
    );
  }
}
