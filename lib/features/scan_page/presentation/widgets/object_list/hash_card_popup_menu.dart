import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:share_plus/share_plus.dart';
import 'package:threedpass/core/theme/d3p_special_colors.dart';
import 'package:threedpass/core/widgets/text/d3p_body_medium_text.dart';
import 'package:threedpass/features/hashes_list/bloc/hashes_list_bloc.dart';
import 'package:threedpass/features/hashes_list/domain/entities/hash_object.dart';
import 'package:threedpass/features/hashes_list/domain/entities/snapshot.dart';

class HashCardPopUpMenuButton extends StatelessWidget {
  const HashCardPopUpMenuButton({
    required this.snapshot,
    required this.hashObject,
    final Key? key,
  }) : super(key: key);

  final Snapshot snapshot;
  final HashObject hashObject;

  void onSelected(final int? value, final BuildContext context) {
    switch (value) {
      case 1:
        Share.share(snapshot.hashes.join('\n'));
        break;
      case 2:
        BlocProvider.of<HashesListBloc>(context).add(
          DeleteHash(
            hash: snapshot,
            object: hashObject,
          ),
        );
        break;
    }
  }

  @override
  Widget build(final BuildContext context) {
    final customColors = Theme.of(context).customColors;
    return PlatformPopupMenu(
      icon: Icon(Icons.more_vert, color: customColors.popMenuIcon),
      options: [
        _PopupMenuOption(
          onTap: () => onSelected(1, context),
          label: 'Share',
          isDestructiveActioniOS: false,
          iconColorAndroid: customColors.popMenuIcon,
          iconDataAndroid: Icons.share,
        ),
        _PopupMenuOption(
          onTap: () => onSelected(2, context),
          label: 'Delete',
          isDestructiveActioniOS: true,
          iconColorAndroid: customColors.popMenuIcon,
          iconDataAndroid: Icons.delete,
        ),
      ],
    );
  }
}

class _PopupMenuOption extends PopupMenuOption {
  _PopupMenuOption({
    required final void Function() onTap,
    required final String label,
    required final IconData iconDataAndroid,
    required final Color iconColorAndroid,
    final bool isDestructiveActioniOS = false,
  }) : super(
          label: label.tr(),
          onTap: (final _) => onTap(),
          material: (final context, final platform) =>
              MaterialPopupMenuOptionData(
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(2, 2, 8, 2),
                  child: Icon(iconDataAndroid, color: iconColorAndroid),
                ),
                D3pBodyMediumText(label.tr()),
              ],
            ),
          ),
          cupertino: (final _, final __) => CupertinoPopupMenuOptionData(
            isDestructiveAction: isDestructiveActioniOS,
          ),
        );
}
