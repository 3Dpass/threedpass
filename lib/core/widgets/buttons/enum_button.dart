import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:threedpass/core/theme/d3p_special_colors.dart';
import 'package:threedpass/core/theme/d3p_special_styles.dart';
import 'package:threedpass/core/theme/d3p_theme.dart';
import 'package:threedpass/core/utils/empty_function.dart';

class EnumButton extends StatelessWidget {
  const EnumButton({
    required this.text,
    required this.isChosen,
    final Key? key,
    this.onPressed,
    // this.backgroundColor,
    this.padding,
  })  : border = const RoundedRectangleBorder(),
        super(key: key);

  static const buttonRadius = Radius.circular(8);

  final void Function()? onPressed;
  // final Color? backgroundColor;
  final RoundedRectangleBorder border;
  final String text;
  final EdgeInsetsGeometry? padding;
  final bool isChosen;

  @override
  Widget build(final BuildContext context) {
    final theme = Theme.of(context);
    final mainColor =
        onPressed != null ? D3pThemeData.mainColor : theme.disabledColor;

    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: SizedBox(
        child: PlatformTextButton(
          onPressed: isChosen ? emptyFunction : onPressed,
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _Icon(
                isEmpty: !isChosen,
              ),
              Text(
                text,
                // style: theme.textTheme.labelLarge,
              ),
            ],
          ),
          material: (final context, final platform) => MaterialTextButtonData(
            style: theme.textButtonTheme.style!.copyWith(
              // padding: MaterialStateProperty.all(EdgeInsets.zero),
              // backgroundColor: MaterialStateProperty.all<Color>(
              //   backgroundColor ?? themeData.cardColor,
              // ),
              foregroundColor: MaterialStateProperty.all(
                isChosen ? mainColor : theme.customColors.themeOpposite,
              ),
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              shape: MaterialStateProperty.all<OutlinedBorder>(border),
            ),
          ),
          cupertino: (final context, final platform) => CupertinoTextButtonData(
            // color: mainColor,
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
          ),
        ),
      ),
    );
  }
}

class _Icon extends StatelessWidget {
  final bool isEmpty;

  const _Icon({required this.isEmpty});

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.chevron_right_outlined,
      color: isEmpty ? Colors.transparent : null,
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
