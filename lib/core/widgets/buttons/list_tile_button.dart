import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:threedpass/core/theme/d3p_special_styles.dart';

import 'package:threedpass/core/widgets/other/right_chevron.dart';

class ListTileButton extends StatelessWidget {
  const ListTileButton.usual({
    required this.text,
    final Key? key,
    this.onPressed,
    this.backgroundColor,
    this.padding,
    this.icon,
  })  : border = const RoundedRectangleBorder(),
        super(key: key);

  static const buttonRadius = Radius.circular(8);

  final void Function()? onPressed;
  final Color? backgroundColor;
  final RoundedRectangleBorder border;
  final String text;
  final EdgeInsetsGeometry? padding;

  // final ListTileButtonType iconType;
  final Widget? icon;

  @override
  Widget build(final BuildContext context) {
    final theme = Theme.of(context);
    final mainColor =
        onPressed != null ? theme.colorScheme.primary : theme.disabledColor;

    final trailingIcon = icon ??
        RightChevron(
          color: mainColor,
        );

    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: SizedBox(
        child: PlatformTextButton(
          padding: EdgeInsets.zero,
          onPressed: onPressed,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  text,
                  style: theme.customTextStyles.d3plabelLarge
                      .copyWith(color: mainColor),
                ),
                trailingIcon,
              ],
            ),
          ),
          material: (final context, final platform) => _ListTileMaterial(
            themeData: theme,
            backgroundColor: backgroundColor,
            border: border,
          ).style(),
          cupertino: (final context, final platform) => CupertinoTextButtonData(
            // color: mainColor,
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
          ),
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
