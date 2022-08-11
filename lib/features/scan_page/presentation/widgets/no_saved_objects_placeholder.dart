import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class NoSavedObjectsPlaceholder extends StatelessWidget {
  const NoSavedObjectsPlaceholder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Text(
          'no_saved_objects_placeholder'.tr(),
          style: Theme.of(context)
              .textTheme
              .subtitle1!
              .copyWith(color: Colors.grey),
        ),
      ),
    );
  }
}
