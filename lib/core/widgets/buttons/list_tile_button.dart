import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class ListTileButton extends StatelessWidget {
  const ListTileButton.bottom({
    required this.text,
    this.onPressed,
    this.backgroundColor,
    this.padding,
    final Key? key,
  })  : border = const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: buttonRadius,
            bottomRight: buttonRadius,
          ),
        ),
        super(key: key);

  const ListTileButton.middle({
    required this.text,
    final Key? key,
    this.onPressed,
    this.backgroundColor,
    this.padding,
  })  : border = const RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),
        super(key: key);

  const ListTileButton.top({
    required this.text,
    final Key? key,
    this.onPressed,
    this.backgroundColor,
    this.padding,
  })  : border = const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: buttonRadius,
            topRight: buttonRadius,
          ),
        ),
        super(key: key);

  const ListTileButton.usual({
    required this.text,
    final Key? key,
    this.onPressed,
    this.backgroundColor,
    this.padding,
  })  : border = const RoundedRectangleBorder(),
        super(key: key);

  static const buttonRadius = Radius.circular(8);

  final void Function()? onPressed;
  final Color? backgroundColor;
  final RoundedRectangleBorder border;
  final String text;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(final BuildContext context) {
    final theme = Theme.of(context);
    final mainColor =
        onPressed != null ? theme.colorScheme.primary : theme.disabledColor;

    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: SizedBox(
        child: PlatformTextButton(
          onPressed: onPressed,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                text,
                style: theme.textTheme.button!.copyWith(color: mainColor),
              ),
              Icon(
                Icons.arrow_right_outlined,
                color: mainColor,
              ),
            ],
          ),
          // TODO Check cupertino theme
          material: (final context, final platform) => _ListTileMaterial(
            themeData: theme,
            backgroundColor: backgroundColor,
            border: border,
          ).style(),
        ),
      ),
    );
  }
}

class _ListTileMaterial {
  final ThemeData themeData;
  final Color? backgroundColor;
  final RoundedRectangleBorder border;

  _ListTileMaterial({
    required this.themeData,
    required this.backgroundColor,
    required this.border,
  });

  MaterialTextButtonData style() {
    return MaterialTextButtonData(
      style: themeData.textButtonTheme.style!.copyWith(
        // padding: MaterialStateProperty.all(EdgeInsets.zero),
        backgroundColor: MaterialStateProperty.all<Color>(
          backgroundColor ?? themeData.cardColor,
        ),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        shape: MaterialStateProperty.all<OutlinedBorder>(border),
      ),
    );
  }
}
