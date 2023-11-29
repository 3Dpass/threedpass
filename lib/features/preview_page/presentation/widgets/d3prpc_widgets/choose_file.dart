import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/widgets/paddings.dart';
import 'package:threedpass/core/widgets/text/d3p_body_large_text.dart';
import 'package:threedpass/features/preview_page/bloc/d3prpc_cubit.dart';

class ChooseFile extends StatelessWidget {
  const ChooseFile({super.key});

  @override
  Widget build(final BuildContext context) {
    final cubit = BlocProvider.of<D3PRPCCubit>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBoxH16(),
        D3pBodyLargeText(
          'chosen_file_to_upload_to_3drpc'
              .tr(args: [cubit.fileHash.toString()]),
          translate: false,
        ),
      ],
    );
  }
}
