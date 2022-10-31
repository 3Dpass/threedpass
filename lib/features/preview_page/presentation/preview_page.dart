import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/widgets/paddings.dart';
import 'package:threedpass/features/preview_page/bloc/preview_page_cubit.dart';
import 'package:threedpass/features/preview_page/presentation/widgets/appbar/preview_appbar.dart';
import 'package:threedpass/features/preview_page/presentation/widgets/delete_snapshot_button.dart';
import 'package:threedpass/features/preview_page/presentation/widgets/hash_properties.dart';
import 'package:threedpass/features/preview_page/presentation/widgets/matches_found/matches_found.dart';
import 'package:threedpass/features/preview_page/presentation/widgets/more_info.dart';
import 'package:threedpass/features/preview_page/presentation/widgets/object_preview/object_preview.dart';
import 'package:threedpass/features/preview_page/presentation/widgets/preview_save_button.dart';
import 'package:threedpass/features/preview_page/presentation/widgets/snapshot_info.dart';
import 'package:threedpass/features/preview_page/presentation/widgets/stable_hash_text.dart';

part 'widgets/preview_page_body.dart';

class PreviewPage extends StatelessWidget {
  const PreviewPage({
    final Key? key,
  }) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    final previewPageCubitState =
        BlocProvider.of<PreviewPageCubit>(context).state;

    return Scaffold(
      appBar: PreviewAppBar(
        hashObject: previewPageCubitState.hashObject,
        snapshot: previewPageCubitState.snapshot,
        themeData: Theme.of(context),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: PreviewPageBody(
          previewPageCubitState: previewPageCubitState,
        ),
      ),
    );
  }
}
