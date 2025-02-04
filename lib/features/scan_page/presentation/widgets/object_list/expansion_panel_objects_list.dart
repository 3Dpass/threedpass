import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/theme/d3p_special_styles.dart';
import 'package:threedpass/core/widgets/other/padding_16.dart';
import 'package:threedpass/features/hashes_list/domain/entities/hash_object.dart';
import 'package:threedpass/features/scan_page/bloc/objects_expanded_cubit.dart';
import 'package:threedpass/features/scan_page/presentation/widgets/object_list/file_hashes_list.dart';

class _Item {
  _Item({
    required this.hashObject,
    this.isExpanded = false,
  });

  HashObject hashObject;
  bool isExpanded;
}

class ExpansionPanelObjectsList extends StatelessWidget {
  const ExpansionPanelObjectsList({required this.objects, super.key});

  final List<HashObject> objects;

  @override
  Widget build(final BuildContext context) {
    final bgColor = Theme.of(context).scaffoldBackgroundColor;

    return SingleChildScrollView(
      child: BlocBuilder<ObjectsExpandedCubit, ObjectsExpandedState>(
        builder:
            (final BuildContext context, final ObjectsExpandedState state) {
          final List<_Item> _data = objects
              .map(
                (final e) => _Item(
                  hashObject: e,
                  isExpanded: state.isExpanded(e),
                ),
              )
              .toList();

          return ExpansionPanelList(
            children: _data.map<ExpansionPanel>((final _Item item) {
              return ExpansionPanel(
                headerBuilder:
                    (final BuildContext context, final bool isExpanded) {
                  return ListTile(
                    title: Text(item.hashObject.name),
                    titleTextStyle:
                        Theme.of(context).customTextStyles.d3ptitleLarge,
                  );
                },
                body: Padding16(
                  child: FileHashesList(currentObject: item.hashObject),
                ),
                isExpanded: item.isExpanded,
                canTapOnHeader: true,
                backgroundColor: bgColor,
              );
            }).toList(),
            expansionCallback: (final int index, final bool isExpanded) =>
                BlocProvider.of<ObjectsExpandedCubit>(context)
                    .set(_data[index].hashObject, isExpanded),
            materialGapSize: 0,
          );
        },
      ),
    );
  }
}
