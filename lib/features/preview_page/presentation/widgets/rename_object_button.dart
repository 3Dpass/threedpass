import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/theme/d3p_special_colors.dart';
import 'package:threedpass/core/widgets/d3p_card.dart';
import 'package:threedpass/features/preview_page/bloc/preview_page_cubit.dart';
import 'package:threedpass/features/settings_page/presentation/widgets/default_settings_button.dart';
import 'package:threedpass/router/router.gr.dart';

class RenameObjectButton extends StatelessWidget {
  const RenameObjectButton({super.key});

  @override
  Widget build(final BuildContext context) {
    final state = BlocProvider.of<PreviewPageCubit>(context).state;
    final colors = Theme.of(context).customColors;
    return DefaultSettingsButton.openButton(
      iconData: Icons.abc_rounded,
      iconColor: colors.themeOpposite,
      textValue: '',
      onPressed: () => context.router.push(
        RenameObjectRoute(
          snapshot: state.snapshot,
          hashObject: state.hashObject!,
        ),
      ),
      text: 'rename_object_button_label',
      cardShape: CardShape.all,
      isChevronGrey: false,
    );
  }
}
