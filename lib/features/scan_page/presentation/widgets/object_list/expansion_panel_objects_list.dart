import 'package:flutter/material.dart';
import 'package:threedpass/core/theme/d3p_special_styles.dart';
import 'package:threedpass/core/widgets/other/padding_16.dart';
import 'package:threedpass/features/hashes_list/domain/entities/hash_object.dart';
import 'package:threedpass/features/scan_page/presentation/widgets/object_list/file_hashes_list.dart';

// stores ExpansionPanel state information
class Item {
  Item({
    required this.hashObject,
    this.isExpanded = false,
  });

  HashObject hashObject;
  bool isExpanded;
}

class ExpansionPanelObjectsList extends StatefulWidget {
  const ExpansionPanelObjectsList({required this.objects, super.key});

  final List<HashObject> objects;

  @override
  State<ExpansionPanelObjectsList> createState() =>
      _ExpansionPanelObjectsListState();
}

class _ExpansionPanelObjectsListState extends State<ExpansionPanelObjectsList> {
  late final List<Item> _data;

  @override
  void initState() {
    super.initState();

    _data = widget.objects
        .map(
          (final e) => Item(
            hashObject: e,
          ),
        )
        .toList();
  }

  @override
  Widget build(final BuildContext context) {
    final bgColor = Theme.of(context).scaffoldBackgroundColor;

    return SingleChildScrollView(
      child: ExpansionPanelList(
        materialGapSize: 0,
        expansionCallback: onExpand,
        children: _data.map<ExpansionPanel>((final Item item) {
          return ExpansionPanel(
            backgroundColor: bgColor,
            headerBuilder: (final BuildContext context, final bool isExpanded) {
              return ListTile(
                title: Text(item.hashObject.name),
                titleTextStyle:
                    Theme.of(context).customTextStyles.d3ptitleLarge,
              );
            },
            body: Padding16(
              child: FileHashesList(
                currentObject: item.hashObject,
              ),
            ),
            isExpanded: item.isExpanded,
            canTapOnHeader: true,
          );
        }).toList(),
      ),
    );
  }

  void onExpand(final int index, final bool isExpanded) {
    setState(() {
      _data[index].isExpanded = isExpanded;
    });
  }
}
