import 'package:flutter/material.dart';
import 'package:threedpass/features/preview_page/bloc/preview_page_cubit.dart';

class SnapshotInfo extends StatelessWidget {
  const SnapshotInfo({
    required this.state,
    final Key? key,
  }) : super(key: key);

  final PreviewPageCubitState state;

  @override
  Widget build(final BuildContext context) {
    return Text.rich(
      TextSpan(
        text: 'Snapshot: ',
        children: [
          TextSpan(
            text: state.snapshot.name,
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  fontStyle: FontStyle.normal,
                ),
          ),
        ],
      ),
      style: Theme.of(context).textTheme.bodyText1!.copyWith(
            fontStyle: FontStyle.italic,
          ),
    );
  }
}
