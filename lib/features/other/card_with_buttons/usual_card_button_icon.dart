import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:threedpass/core/widgets/paddings.dart';
import 'package:threedpass/core/widgets/progress_indicator/progress_indicator.dart';

class UsualCardButtonIcon extends StatelessWidget {
  final IconData iconData;
  final String title;
  final bool isLoading;

  const UsualCardButtonIcon({
    required this.iconData,
    required this.title,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 24,
          width: 24,
          child: isLoading
              ? const D3pProgressIndicator(
                  size: null,
                  strokeWidth: 2,
                )
              : Icon(iconData),
        ),
        H8(),
        SizedBox(
          height: 32,
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Text(
              title.tr(),
              maxLines: 2,
              // textAlign: TextAlign.left,
            ),
          ),
        ),
      ],
    );
  }
}
