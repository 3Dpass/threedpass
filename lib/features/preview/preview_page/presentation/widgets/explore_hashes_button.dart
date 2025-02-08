import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/widgets/buttons/elevated_button.dart';
import 'package:threedpass/core/widgets/other/padding_16.dart';
import 'package:threedpass/features/preview/preview_page/bloc/preview_page_cubit.dart';
import 'package:threedpass/router/router.gr.dart';

class ExploreHashesButton extends StatelessWidget {
  const ExploreHashesButton({super.key});

  @override
  Widget build(final BuildContext context) {
    final state = BlocProvider.of<PreviewPageCubit>(context);
    final snapshot = state.state;
    // final colors = Theme.of(context).customColors;
    // final bgColor = colors.cardBackground;
    // final fgColorBright = colors.themeOpposite;
    // const fgColorDim = D3pColors.disabled;

    final isActive = state.hashObject.snapshots.length > 1;

    return Padding16(
      child: D3pElevatedButton(
        text: 'explore_hashes_button_title'.tr(),
        onPressed: isActive
            ? () => context.router.push(
                  CompareRouteWrapper(
                    origObj: snapshot,
                    hashObject: state.hashObject,
                  ),
                )
            : null,
        iconData: Icons.compare_arrows_rounded,
      ),
    );
  }
}
