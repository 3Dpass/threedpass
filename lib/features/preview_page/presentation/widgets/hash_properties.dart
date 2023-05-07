import 'package:flutter/material.dart';
import 'package:threedpass/features/hashes_list/domain/entities/snapshot.dart';
import 'package:threedpass/features/settings_page/presentation/widgets/settings_text.dart';

class HashProperties extends StatelessWidget {
  const HashProperties({
    required this.snapshot,
    final Key? key,
  }) : super(key: key);

  final Snapshot snapshot;

  @override
  Widget build(final BuildContext context) {
    return SingleChildScrollView(
      child: ListBody(
        children: [
          Text.rich(snapshot.settingsConfig.toText(context)),
        ],
      ),
    );
  }
}
