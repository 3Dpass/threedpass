import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/theme/d3p_special_styles.dart';
import 'package:threedpass/core/widgets/buttons/elevated_button.dart';
import 'package:threedpass/core/widgets/other/padding_16.dart';
import 'package:threedpass/features/preview_page/bloc/preview_page_cubit.dart';
import 'package:threedpass/router/router.gr.dart';

class ExploreSnapshotsButton extends StatelessWidget {
  const ExploreSnapshotsButton({super.key});

  @override
  Widget build(final BuildContext context) {
    final hashes =
        BlocProvider.of<PreviewPageCubit>(context).state.snapshot.hashes;

    return Padding16(
      child: D3pElevatedButton(
        text: 'Explore Hashes',
        iconData: Icons.compare_arrows_rounded,
        onPressed: () {}, // PUSH to compare page
      ),
    );
  }
}
