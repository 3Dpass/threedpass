import 'package:flutter/material.dart';
import 'package:threedpass/core/widgets/other/padding_16.dart';
import 'package:threedpass/features/preview/preview_page/bloc/preview_page_cubit.dart';

class SnapshotInfo extends StatelessWidget {
  const SnapshotInfo({
    required this.state,
    final Key? key,
  }) : super(key: key);

  final PreviewPageCubitState state;

  @override
  Widget build(final BuildContext context) {
    final textTheme = Theme.of(context).textTheme.bodyLarge;
    return Padding16(
      child: Text(
        state.snapshot.name,
        style: textTheme,
      ),
    );
  }
}
