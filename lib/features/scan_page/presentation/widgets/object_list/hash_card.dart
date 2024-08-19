import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/theme/d3p_colors.dart';
import 'package:threedpass/core/theme/d3p_theme.dart';
import 'package:threedpass/core/utils/formatters.dart';
import 'package:threedpass/core/widgets/buttons/clickable_card.dart';
import 'package:threedpass/core/widgets/paddings.dart';
import 'package:threedpass/core/widgets/text/d3p_body_medium_text.dart';
import 'package:threedpass/features/hashes_list/bloc/hashes_list_bloc.dart';
import 'package:threedpass/features/hashes_list/domain/entities/hash_object.dart';
import 'package:threedpass/features/hashes_list/domain/entities/snapshot.dart';
import 'package:threedpass/features/scan_page/presentation/widgets/object_list/chain_status.dart';
import 'package:threedpass/features/settings_page/presentation/widgets/settings_text.dart';
import 'package:threedpass/router/router.gr.dart';

class SnapshotCard extends StatelessWidget {
  const SnapshotCard({
    required this.snapshot,
    required this.hashObject,
    this.onTap,
    this.areSelectable = false,
    this.isSelected = false,
    this.setGlobalKey = false,
    final Key? key,
  }) : super(key: key);

  final Snapshot snapshot;
  final HashObject hashObject;
  final void Function()? onTap;
  final bool areSelectable;
  final bool isSelected;
  final bool setGlobalKey;

  @override
  Widget build(final BuildContext context) {
    final theme = Theme.of(context).textTheme;
    final hashesListBloc = BlocProvider.of<HashesListBloc>(context);
    // final hashesListState = hashesListBloc.state as HashesListLoaded;

    return ClickableCard(
      // key: setGlobalKey ? hashesListState.globalKeyMap[snapshot] : null,
      onTap: onTap ??
          () async {
            await context.router.push(
              PreviewRouteWrapper(
                hashObject: hashObject,
                snapshot: snapshot,
              ),
            );
            if (snapshot.isNew) {
              hashesListBloc.add(
                UnmarkNewSnap(
                  object: hashObject,
                  snap: snapshot,
                ),
              );
            }
          },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Wrap(
            children: [
              // Flexible(
              //   child:
              Text(
                snapshot.name,
                style: theme.bodyLarge,
              ),
              // ),
              if (snapshot.isNew)
                Icon(
                  Icons.fiber_new_outlined,
                  color: D3pThemeData.mainColor,
                ),
            ],
          ),
          const H8(),
          Text.rich(
            snapshot.settingsConfig.toShort(context),
          ),
          const H8(),
          ChainStatus(
            snap: snapshot,
          ),
          // Text('Chain status: Uploaded'),
          // const SizedBoxH8(),
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
                if (areSelectable)
                  Icon(
                    isSelected
                        ? Icons.check_box_rounded
                        : Icons.check_box_outline_blank_rounded,
                    color: D3pThemeData.mainColor,
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
