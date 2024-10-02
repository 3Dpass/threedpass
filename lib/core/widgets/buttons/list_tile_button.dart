import 'package:flutter/material.dart';
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
        child: TextButton(
          // TODO Cupertino?
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            backgroundColor: theme.cardColor,
            shape: border,
          ),
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
          // cupertino: (final context, final platform) => CupertinoTextButtonData(
          //   // color: mainColor,
          //   padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
          // ),
        ),
      ),
    );
  }
}
