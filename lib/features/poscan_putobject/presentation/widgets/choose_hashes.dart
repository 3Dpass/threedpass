import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/widgets/paddings.dart';
import 'package:threedpass/core/widgets/text/d3p_body_medium_text.dart';
import 'package:threedpass/features/preview/preview_page/bloc/preview_page_cubit.dart';

class ChooseHashes extends StatelessWidget {
  const ChooseHashes({super.key});

  @override
  Widget build(final BuildContext context) {
    final state = BlocProvider.of<PreviewPageCubit>(context).state;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const D3pBodyMediumText('poscan_putobject_choose_hashes'),
        const H4(),
        D3pBodyMediumText(
          state.snapshot.hashes.join('\n'),
          translate: false,
        ),
      ],
    );
  }
}
