import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    // final colors = Theme.of(context).customColors;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: BlocBuilder<TransferInfoBloc, TransferInfoBlocState>(
        builder: (final context, final state) {
          if (condition(state)) {
            return Align(
              child: SizedBox(
                height: 43,
                child: Center(
                  child: D3pIconButton(
                    emptyContraints: true,
                    padding: EdgeInsets.zero,
                    iconData: Icons.add_circle_outline_rounded,
                    onPressed: onPressed,
                  ),
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
