import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/theme/d3p_special_colors.dart';
import 'package:threedpass/core/theme/d3p_special_styles.dart';
import 'package:threedpass/core/widgets/buttons/elevated_button.dart';
import 'package:threedpass/core/widgets/buttons/icon_button.dart';
import 'package:threedpass/features/wallet_screen/transfer_page/bloc/transfer_info_bloc.dart';

class AddCardRowBasic extends StatelessWidget {
  const AddCardRowBasic({
    required this.onPressed,
    required this.unlocalizedText,
    required this.condition,
    super.key,
  });

  final void Function() onPressed;
  final String unlocalizedText;
  final bool Function(TransferInfoBlocState state) condition;

  @override
  Widget build(final BuildContext context) {
    final textStyle = Theme.of(context).customTextStyles;
    final colors = Theme.of(context).customColors;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: BlocBuilder<TransferInfoBloc, TransferInfoBlocState>(
        builder: (final context, final state) {
          if (condition(state)) {
            return SizedBox(
              height: 43,
              child: D3pElevatedButton(
                text: null,
                onPressed: onPressed,
                backgroundColor: colors.cardBackground,
                // elevation: 0,
                childAlignment: MainAxisAlignment.start,
                textStyle: textStyle.d3pBodyMedium,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    D3pIconButton(
                      iconData: Icons.add_circle_outline_rounded,
                      onPressed: () => onPressed(),
                      emptyContraints: true,
                      iconColor: colors.themeOpposite,
                    ),
                  ],
                ),
              ),
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
