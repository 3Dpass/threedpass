import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/widgets/buttons/clickable_card.dart';
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
    return BlocBuilder<PoscanPutObjectCubit, D3PRPCCubitState>(
      builder: (final context, final state) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const D3pBodyMediumText("put_object_properties_subtitle"),
            const H4(),
            state.defaultProperties.isEmpty
                ? const H16()
                : ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: state.defaultProperties.length,
                    separatorBuilder: (final context, final index) =>
                        const SizedBox(height: 2),
                    itemBuilder: (final context, final index) {
                      final prop = state.defaultProperties.elementAt(index);
                      return SizedBox(
                        height: 50,
                        child: ClickableCard(
                          padding: ClickableCard.buttonPaddingPreset,
                          onTap: () =>
                              BlocProvider.of<PoscanPutObjectCubit>(context)
                                  .toggleProp(prop),
                          child: PropertyTileContent(
                            prop: prop,
                            isChosen: state.chosenProperties.contains(prop),
                            onPressedEditCallback: onPressedEditCallback,
                          ),
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
