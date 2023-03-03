import 'package:flutter/material.dart';
import 'package:threedpass/core/theme/d3p_special_styles.dart';
import 'package:threedpass/features/preview_page/bloc/preview_page_cubit.dart';

class SnapshotInfo extends StatelessWidget {
  const SnapshotInfo({
    required this.state,
    final Key? key,
  }) : super(key: key);

  final PreviewPageCubitState state;

  @override
  Widget build(final BuildContext context) {
    final textTheme = Theme.of(context).customTextStyles.d3pBodyLarge;
    return Text.rich(
      TextSpan(
        text: 'Snapshot: ',
        children: [
          TextSpan(
            text: state.snapshot.name,
            style: textTheme.copyWith(
              fontStyle: FontStyle.normal,
            ),
          ),
        ],
      ),
      style: textTheme.copyWith(
        fontStyle: FontStyle.italic,
      ),
    );
  }
}
