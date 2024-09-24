import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/widgets/other/padding_16.dart';
import 'package:threedpass/features/preview/preview_page/bloc/preview_page_cubit.dart';

class SnapshotInfo extends StatelessWidget {
  const SnapshotInfo({
    final Key? key,
  }) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    final textTheme = Theme.of(context).textTheme.bodyLarge;
    final snapshot = BlocProvider.of<PreviewPageCubit>(context).state;
    return Padding16(
      child: Text(
        snapshot.name,
        style: textTheme,
      ),
    );
  }
}
