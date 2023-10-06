import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/theme/d3p_special_styles.dart';
import 'package:threedpass/core/widgets/buttons/icon_button.dart';
import 'package:threedpass/features/wallet_screen/bloc/transfer_info_cubit.dart';

class AddCardRowBasic extends StatelessWidget {
  const AddCardRowBasic({
    required this.onPressed,
    required this.unlocalizedText,
    required this.condition,
    super.key,
  });

  final void Function() onPressed;
  final String unlocalizedText;
  final bool Function(TransferInfo state) condition;

  @override
  Widget build(final BuildContext context) {
    final textStyles = Theme.of(context).customTextStyles;
    return BlocBuilder<TransferInfoCubit, TransferInfo>(
      builder: (final context, final state) {
        if (condition(state)) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Row(
              children: [
                const Flexible(
                  flex: 1,
                  child: SizedBox(
                    width: double.infinity,
                  ),
                ),
                const SizedBox(width: 8),
                D3pIconButton(
                  iconData: Icons.add_circle_outline_rounded,
                  onPressed: () => onPressed(),
                  emptyContraints: true,
                ),
                const SizedBox(width: 8),
                Flexible(
                  flex: 1,
                  child: Text(
                    unlocalizedText.tr(),
                    style: textStyles.hintStyle,
                  ),
                ),
              ],
            ),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
