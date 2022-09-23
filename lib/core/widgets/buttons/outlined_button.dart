import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

/// Experimental
class D3pOutlinedButton extends StatelessWidget {
  const D3pOutlinedButton({
    Key? key,
    required this.text,
    this.width,
    this.height,
    this.padding,
    this.onPressed,
  }) : super(key: key);

  final void Function()? onPressed;
  final String text;
  final double? height;
  final double? width;
  final EdgeInsets? padding;

  MaterialElevatedButtonData materialTheme(context, __) {
    final theme = Theme.of(context);
    return MaterialElevatedButtonData(
      style: OutlinedButton.styleFrom(
        elevation: 0,
        primary: theme.colorScheme.primary,
        // onSurface: Colors.amber,
        backgroundColor: theme.canvasColor,
        side: BorderSide(
          color: theme.colorScheme.primary,
          width: 1,
        ),
        shape: StadiumBorder(
            // borderRadius: BorderRadius.circular(8),
            ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: SizedBox(
        height: height,
        width: width,
        child: PlatformElevatedButton(
          child: Text(text),
          onPressed: onPressed,
          material: materialTheme,
        ),
      ),
    );
  }
}
