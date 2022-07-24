import 'package:flutter/material.dart';
import 'package:threedpass/features/hashes_list/domain/entities/snapshot.dart';
import 'package:threedpass/features/settings_page/presentation/widgets/settings_text.dart';

class HashProperties extends StatelessWidget {
  const HashProperties({
    Key? key,
    required this.snapshot,
  }) : super(key: key);

  final Snapshot snapshot;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ListBody(
        children: [
          const Text('Strong'),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 5),
            child: LinearProgressIndicator(
              value: 0.6, // TODO How does the strength of a hash counted?
            ),
          ),
          const Text('Properties:'),
          const Text('- 256bit'), // TODO What properties are avaliable?
          const SizedBox(height: 16),
          snapshot.settingsConfig != null
              ? Text.rich(snapshot.settingsConfig!.textSpan)
              : const SizedBox(),
        ],
      ),
    );
  }
}
