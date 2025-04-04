import 'package:flutter/material.dart';
import 'package:threedpass/core/widgets/paddings.dart';
import 'package:threedpass/features/other/card_with_buttons/card_button.dart';
import 'package:threedpass/features/other/sliver_separated_list.dart';

class CardButtonsList extends StatelessWidget {
  final List<Widget> buttons;
  final EdgeInsetsGeometry padding;

  const CardButtonsList({
    required this.buttons,
    required this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return SliverSeparatedList(
      padding: padding,
      children: buttons,
      separator: const W16(),
      size: Size.fromHeight(
        CardButton.size,
      ),
      scrollDirection: Axis.horizontal,
    );
  }
}
