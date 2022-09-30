import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:threedpass/features/hashes_list/domain/entities/hash_object.dart';
import 'package:threedpass/features/hashes_list/domain/entities/snapshot.dart';

class StableHashText extends StatelessWidget {
  final HashObject? hashObject;

  const StableHashText({
    Key? key,
    required this.hashObject,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (hashObject == null) {
      return const _Placeholder();
    }

    final hashes = hashObject!.stableHashes;
    return hashes.isEmpty
        ? const _Placeholder()
        : Text.rich(
            TextSpan(
              text: 'stable_hashes_list_title'.tr(),
              children: hashes.map(
                (e) {
                  return TextSpan(
                    text: e,
                  );
                },
              ).toList(),
            ),
            style: Theme.of(context).textTheme.bodyText1,
          );
  }
}

class _Placeholder extends StatelessWidget {
  const _Placeholder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Text(
        'no_stable_hash_placeholder'.tr(),
        style: Theme.of(context).textTheme.bodyText1,
      );
}
