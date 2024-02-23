import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/theme/d3p_colors.dart';
import 'package:threedpass/core/theme/d3p_special_styles.dart';
import 'package:threedpass/core/theme/d3p_theme.dart';
import 'package:threedpass/core/utils/formatters.dart';
import 'package:threedpass/core/widgets/buttons/clickable_card.dart';
import 'package:threedpass/core/widgets/paddings.dart';
import 'package:threedpass/core/widgets/text/d3p_body_medium_text.dart';
import 'package:threedpass/features/hashes_list/bloc/hashes_list_bloc.dart';
import 'package:threedpass/features/hashes_list/domain/entities/hash_object.dart';
import 'package:threedpass/features/hashes_list/domain/entities/snapshot.dart';
import 'package:threedpass/features/scan_page/bloc/select_snapshots_cubit.dart';
import 'package:threedpass/features/settings_page/presentation/widgets/settings_text.dart';
import 'package:threedpass/router/router.gr.dart';

class SnapshotCard extends StatelessWidget {
  const SnapshotCard({
    required this.snapshot,
    required this.hashObject,
    this.onTap,
    final Key? key,
  }) : super(key: key);

  final Snapshot snapshot;
  final HashObject hashObject;
  final void Function()? onTap;

  @override
  Widget build(final BuildContext context) {
    final theme = Theme.of(context).customTextStyles;
    final hashesListState =
        BlocProvider.of<HashesListBloc>(context).state as HashesListLoaded;

    return BlocBuilder<SelectSnapshotsCubit, SelectSnapshotsState>(
      buildWhen: (final previous, final current) =>
          previous.areSelectable != current.areSelectable ||
          previous.snaps.contains(snapshot) != current.snaps.contains(snapshot),
      builder: (final _, final state) => ClickableCard(
        key: hashesListState.globalKeyMap[snapshot],
        onTap: state.areSelectable
            ? () =>
                BlocProvider.of<SelectSnapshotsCubit>(context).toggle(snapshot)
            : () => context.router.push(
                  PreviewRouteWrapper(
                    hashObject: hashObject,
                    snapshot: snapshot,
                  ),
                ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  child: Text(
                    snapshot.name,
                    style: theme.d3pBodyLarge,
                  ),
                ),
                if (snapshot.isNew)
                  Icon(
                    Icons.fiber_new_outlined,
                    color: D3pThemeData.mainColor,
                  ),
              ],
            ),
            const SizedBoxH8(),
            Text.rich(
              snapshot.settingsConfig.toShort(context),
            ),
            const SizedBoxH8(),
            SizedBox(
              height: 24,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  D3pBodyMediumText(
                    Fmt.basicDateFormat.format(snapshot.stamp),
                    translate: false,
                    color: D3pColors.disabled,
                  ),
                  if (state.areSelectable)
                    Icon(
                      state.snaps.contains(snapshot)
                          ? Icons.check_box_rounded
                          : Icons.check_box_outline_blank_rounded,
                      color: D3pThemeData.mainColor,
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
