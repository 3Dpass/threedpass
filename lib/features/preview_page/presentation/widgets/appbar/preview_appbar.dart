import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:threedpass/core/theme/d3p_special_styles.dart';
import 'package:threedpass/features/hashes_list/domain/entities/hash_object.dart';

class PreviewAppbarTitle extends StatelessWidget {
  const PreviewAppbarTitle({
    required this.hashObject,
    super.key,
  });

  final HashObject? hashObject;

  @override
  Widget build(final BuildContext context) {
    final themeData = Theme.of(context);
    return hashObject != null
        ? Flexible(
            child: Text(
              hashObject!.name,
              overflow: TextOverflow.ellipsis,
              style: themeData.customTextStyles.appBarTextBright,
            ),
          )
        : Text(
            'unsaved_object_appbar'.tr(),
            style: themeData.customTextStyles.appBarTextBright,
          );
  }
}
