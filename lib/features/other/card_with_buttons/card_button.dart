import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:threedpass/core/utils/get_theme.dart';
import 'package:threedpass/core/widgets/paddings.dart';
import 'package:threedpass/core/widgets/progress_indicator/progress_indicator.dart';

class CardButton extends StatelessWidget {
  final Widget icon;
  final String title;
  final bool isLoading;
  final VoidCallback? onButtonPressed;
  final int? badge;

  static const double size = 90;

  const CardButton({
    required this.icon,
    required this.title,
    this.isLoading = false,
    this.onButtonPressed,
    this.badge,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size,
      width: size,
      child: TextButton(
        onPressed: onButtonPressed,
        style: TextButton.styleFrom(
          textStyle: context.textTheme.labelSmall,
          backgroundColor: context.theme.colorScheme.surfaceContainer,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 24,
              width: 24,
              child: isLoading
                  ? const D3pProgressIndicator(
                      size: 24,
                      strokeWidth: 2,
                    )
                  : icon,
            ),
            H8(),
            SizedBox(
              height: 32,
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  title.tr(),
                  maxLines: 2,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
