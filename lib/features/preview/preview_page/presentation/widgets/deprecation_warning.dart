import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/features/preview/preview_page/bloc/preview_page_cubit.dart';

class DeprecationWarning extends StatelessWidget {
  const DeprecationWarning({super.key});

  @override
  Widget build(final BuildContext context) {
    final snap = BlocProvider.of<PreviewPageCubit>(context).state.snapshot;

    if (snap.externalPathToObj != null) {
      return Flexible(
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
          child: Text(
            'WARNING: this snapshot was made in a deprecated way. It depends on external file. Modifying or loss of a file may result in undefined behavior. Please rescan the file with the same settings. Path:\n${snap.externalPathToObj}',
          ),
        ),
      );
    } else {
      return const SizedBox();
    }
  }
}
