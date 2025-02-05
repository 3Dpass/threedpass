import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/theme/d3p_special_styles.dart';
import 'package:threedpass/core/widgets/other/padding_16.dart';
import 'package:threedpass/features/preview/preview_page/bloc/preview_page_cubit.dart';
import 'package:threedpass/features/preview/preview_page/presentation/widgets/copy_text_card.dart';

class FileHashBlock extends StatelessWidget {
  const FileHashBlock({super.key});

  @override
  Widget build(final BuildContext context) {
    final snap = BlocProvider.of<PreviewPageCubit>(context).state;

    final fileHashText = snap.fileHash.toString();

    return Padding16(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'file_hash_title'.tr(),
            style: Theme.of(context).customTextStyles.d3plabelLarge,
          ),
          CopyTextCard(
            textToShow: 'file_hash_copied'.tr(),
            textToCopy: fileHashText,
            child: Text(fileHashText),
          ),
        ],
      ),
    );
  }
}
