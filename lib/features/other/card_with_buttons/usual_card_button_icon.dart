import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:threedpass/core/widgets/paddings.dart';

class UsualCardButtonIcon extends StatelessWidget {
  final IconData iconData;
  final String title;

  const UsualCardButtonIcon({required this.iconData, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(iconData),
        H8(),
        Text(
          title.tr(),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
