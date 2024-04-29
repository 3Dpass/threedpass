import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/widgets/text/d3p_body_large_text.dart';
import 'package:threedpass/features/poscan_putobject/bloc/poscan_putobject_cubit.dart';

class ChooseFile extends StatelessWidget {
  const ChooseFile({super.key});

  @override
  Widget build(final BuildContext context) {
    final cubit = BlocProvider.of<PoscanPutObjectCubit>(context);
    return D3pBodyLargeText(
      'chosen_file_to_upload_to_3drpc'.tr(args: [cubit.fileHash.toString()]),
      translate: false,
    );
  }
}
