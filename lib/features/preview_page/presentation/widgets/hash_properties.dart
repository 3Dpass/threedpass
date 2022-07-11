import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/features/hashes_list/domain/entities/snapshot.dart';
import 'package:threedpass/features/settings_page/presentation/cubit/settings_page_cubit.dart';
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
          Text("Strong"),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5),
            child: LinearProgressIndicator(
              value: 0.6, // TODO How is the strength of a hash counted?
            ),
          ),
          Text("Properties:"),
          Text("- 256bit"), // TODO What properties are avaliable?
          SizedBox(height: 16),
          snapshot.settingsConfig != null
              ? Text.rich(snapshot.settingsConfig!.textSpan)
              : const SizedBox(),
        ],
      ),
    );
  }
}
