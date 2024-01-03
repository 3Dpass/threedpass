import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:polkawallet_sdk/p3d/prop_value.dart';
import 'package:threedpass/core/theme/d3p_special_styles.dart';
import 'package:threedpass/core/widgets/buttons/enum_button.dart';
import 'package:threedpass/features/poscan_putobject/bloc/poscan_putobject_cubit.dart';
import 'package:threedpass/features/poscan_putobject/domain/entities/poscan_property.dart';
import 'package:threedpass/features/poscan_putobject/presentation/widgets/open_bottom_sheet.dart';
import 'package:threedpass/features/poscan_putobject/presentation/widgets/property_tile_text.dart';

class ChooseProperties extends StatelessWidget {
  const ChooseProperties({super.key});

  @override
  Widget build(final BuildContext context) {
    final textStyle = Theme.of(context).customTextStyles;

    // Non-fungible - 0, Share - 1
    final List<PoscanProperty> properties = [
      PoscanProperty(
        name: 'Non-fungible',
        propValue: PropValue(maxValue: BigInt.one, propIdx: 0),
      ),
      PoscanProperty(
        name: 'Share',
        propValue: PropValue(maxValue: BigInt.from(100000000), propIdx: 1),
      ),
    ];
    return OpenBottomSheet(
      unlocalizedSubtitle: 'poscan_putobject_choose_properties',
      bottomSheetPlatform: BlocBuilder<PoscanPutObjectCubit, D3PRPCCubitState>(
        builder: (final context, final state) => ListView.builder(
          shrinkWrap: true,
          itemCount: properties.length,
          itemBuilder: (final context, final index) {
            final prop = properties.elementAt(index);
            return EnumButton(
              text: null,
              isChosen: state.properties.contains(prop),
              onPressed: () => BlocProvider.of<PoscanPutObjectCubit>(context)
                  .toggleProp(prop),
              child: PropertyTileText(
                prop: prop,
                isChosen: state.properties.contains(prop),
              ),
            );
          },
        ),
      ),
      buttonIconData: Icons.add,
      buttonTextChild: BlocBuilder<PoscanPutObjectCubit, D3PRPCCubitState>(
        buildWhen: (final previous, final current) =>
            previous.properties != current.properties,
        builder: (final context, final state) => Text(
          'PROPERTIES_number_plural'.plural(
            state.properties.length,
          ),
          style: textStyle.d3pBodyMedium,
        ),
      ),
    );
  }
}
