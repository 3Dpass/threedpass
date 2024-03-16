import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/theme/d3p_special_colors.dart';
import 'package:threedpass/core/widgets/buttons/elevated_button.dart';
import 'package:threedpass/core/widgets/paddings.dart';
import 'package:threedpass/core/widgets/text/d3p_body_medium_text.dart';
import 'package:threedpass/features/poscan_putobject/bloc/poscan_putobject_cubit.dart';
import 'package:threedpass/features/poscan_putobject/domain/entities/poscan_property.dart';
import 'package:threedpass/features/poscan_putobject/presentation/widgets/edit_property_dialog.dart';
import 'package:threedpass/features/poscan_putobject/presentation/widgets/property_tile_content.dart';

class ChooseProperties extends StatelessWidget {
  const ChooseProperties({super.key});

  @override
  Widget build(final BuildContext context) {
    final colors = Theme.of(context).customColors;
    return BlocBuilder<PoscanPutObjectCubit, D3PRPCCubitState>(
      builder: (final context, final state) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBoxH16(),
            const D3pBodyMediumText("Properties"),
            const SizedBoxH4(),
            state.defaultProperties.isEmpty
                ? const SizedBoxH16()
                : ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: state.defaultProperties.length,
                    itemBuilder: (final context, final index) {
                      final prop = state.defaultProperties.elementAt(index);
                      return D3pElevatedButton(
                        padding: const EdgeInsets.only(top: 2),
                        onPressed: () =>
                            BlocProvider.of<PoscanPutObjectCubit>(context)
                                .toggleProp(prop),
                        backgroundColor: colors.cardBackground,
                        elevation: 1,
                        childAlignment: MainAxisAlignment.start,
                        text: null,
                        child: PropertyTileContent(
                          prop: prop,
                          isChosen: state.chosenProperties.contains(prop),
                          onPressedEditCallback: onPressedEditCallback,
                        ),
                      );
                    },
                  ),
          ],
        );
      },
    );
  }

  void onPressedEditCallback(
    final BuildContext parentContext,
    final PoscanProperty prop,
  ) {
    showDialog<void>(
      context: parentContext,
      builder: (final BuildContext context) {
        return BlocProvider.value(
          value: BlocProvider.of<PoscanPutObjectCubit>(parentContext),
          child: EditPropertyDialog(prop: prop),
        );
      },
    );
  }
}
