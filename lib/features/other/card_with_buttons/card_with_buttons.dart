import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:threedpass/features/other/card_with_buttons/card_buttons_list.dart';

class CardWithButtons extends StatelessWidget {
  final List<Widget> buttons;
  final String title;

  static const double padding = 16;

  const CardWithButtons({
    required this.buttons,
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card.filled(
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: padding),
          Padding(
            padding: EdgeInsets.only(left: padding),
            child: Text(title.tr()),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: padding),
            child: CardButtonsList(
              buttons: buttons,
              padding: EdgeInsets.symmetric(horizontal: padding),
            ),
          ),
        ],
      ),
    );
  }
}
