import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share_plus/share_plus.dart';
import 'package:threedpass/core/theme/d3p_special_colors.dart';
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
    return PopupMenuButton(
      icon: Icon(Icons.more_vert, color: customColors.popMenuIcon),
      onSelected: (final int? value) => onSelected(value, context),
      itemBuilder: (final context) => [
        PopupMenuItem(
          value: 1,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(2, 2, 8, 2),
                child: Icon(Icons.share, color: customColors.popMenuIcon),
              ),
              Text('Share'.tr()),
            ],
          ),
        ),
        PopupMenuItem(
          value: 2,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(2, 2, 8, 2),
                child: Icon(Icons.delete, color: customColors.popMenuIcon),
              ),
              Text('Delete'.tr()),
            ],
          ),
        ),
      ],
    );
  }
}
