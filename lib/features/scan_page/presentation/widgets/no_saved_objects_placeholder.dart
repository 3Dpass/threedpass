import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:threedpass/core/theme/d3p_special_styles.dart';

class NoSavedObjectsPlaceholder extends StatelessWidget {
  const NoSavedObjectsPlaceholder({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Text(
          'no_saved_objects_placeholder'.tr(),
          style: theme.customTextStyles.noObjectsPlaceholder,
        ),
      ),
    );
  }
}
