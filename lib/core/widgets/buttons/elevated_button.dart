import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class D3pElevatedButton extends StatelessWidget {
  const D3pElevatedButton({
    required this.text,
    final Key? key,
    this.onPressed,
    this.iconData,
    this.minimumSize,
    this.padding,
    this.icon,
    this.backgroundColor,
    this.foregroundColor,
  }) : super(key: key);

  final void Function()? onPressed;
  final String text;
  final IconData? iconData;
  final Size? minimumSize;
  final EdgeInsets? padding;
  final Widget? icon;
  final Color? foregroundColor;
  final Color? backgroundColor;

  @override
  Widget build(final BuildContext context) {
    // final d3pElevatedTheme = D3pElevatedButtonStyle(
    //   themeData: Theme.of(context),
    //   isButtonActive: onPressed != null,
    //   minimumSize: minimumSize,
    //   foregroundColor: foregroundColor,
    //   backgroundColor: backgroundColor,
    // );

    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: SizedBox(
        child: PlatformElevatedButton(
          padding: padding ?? EdgeInsets.zero,
          onPressed: onPressed,
          // material: (final context, final platform) =>
          //     d3pElevatedTheme.resolveMaterial(
          //   text: text,
          //   icon: icon,
          //   iconData: iconData,
          // ),
          // cupertino: (final context, final _) =>
          //     d3pElevatedTheme.resolveCupertino(
          //   context: context,
          //   text: text,
          //   icon: icon,
          //   iconData: iconData,
          // ),
          child: _ElevatedButtonChild(
            icon: icon,
            iconData: iconData,
            text: text,
          ),
        ),
      ),
    );
  }
}

class _ElevatedButtonChild extends StatelessWidget {
  const _ElevatedButtonChild({
    required this.icon,
    required this.iconData,
    required this.text,
    this.textStyle,
  });

  final String text;
  final IconData? iconData;
  final Widget? icon;
  final TextStyle? textStyle;

  @override
  Widget build(final BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _Icon(
          icon: icon,
          iconData: iconData,
        ),
        Text(
          text,
          style: textStyle,
        ),
      ],
    );
  }
}

// /// Default styles are for elevated buttons on canvas background
// class D3pElevatedButtonThemeData {
//   final Color backgroundColor;
//   final Color foregroundColor;

//   // const D3pElevatedButtonThemeData._({
//   //   required this.backgroundColor,
//   //   required this.foregroundColor,
//   // });

//   D3pElevatedButtonThemeData.active(final ThemeData themeData)
//       : backgroundColor = themeData.colorScheme.primary,
//         foregroundColor = themeData.colorScheme.onPrimary;

//   D3pElevatedButtonThemeData.disabled(final ThemeData themeData)
//       : backgroundColor = themeData.cardColor,
//         foregroundColor = themeData.colorScheme.onSurface.withOpacity(0.50);
// }

// class D3pElevatedButtonStyle {
//   final bool isButtonActive;
//   final ThemeData themeData;

//   final Size? minimumSize;
//   final Color? foregroundColor;
//   final Color? backgroundColor;

//   const D3pElevatedButtonStyle({
//     required this.isButtonActive,
//     required this.themeData,
//     required this.foregroundColor,
//     required this.backgroundColor,
//     required this.minimumSize,
//   });

//   MaterialElevatedButtonData resolveMaterial({
//     required final Widget? icon,
//     required final IconData? iconData,
//     required final String text,
//   }) {
//     return MaterialElevatedButtonData(
//       child: _ElevatedButtonChild(
//         icon: icon,
//         iconData: iconData,
//         text: text,
//       ),
//     );
//   }

//   CupertinoElevatedButtonData resolveCupertino({
//     required final BuildContext context,
//     required final Widget? icon,
//     required final IconData? iconData,
//     required final String text,
//   }) {
//     return CupertinoElevatedButtonData(
//       // color: Colors.orange,
//       originalStyle: false,
//       // onPressed: () {},
//       // disabledColor: Colors.amber,
//       child: _ElevatedButtonChild(
//         icon: icon,
//         iconData: iconData,
//         text: text,
//       ),
//     );
//   }
// }

class _Icon extends StatelessWidget {
  const _Icon({
    required this.iconData,
    required this.icon,
    final Key? key,
  }) : super(key: key);

  final IconData? iconData;
  final Widget? icon;

  @override
  Widget build(final BuildContext context) {
    assert(
      icon == null || iconData == null,
      'Either icon or iconData must be provided. Now both icon and iconData are not null.',
    );

    if (iconData != null) {
      return Padding(
        padding: const EdgeInsets.only(right: 8),
        child: Icon(iconData),
      );
    } else if (icon != null) {
      return Padding(
        padding: const EdgeInsets.only(right: 8),
        child: icon,
      );
    } else {
      return const SizedBox();
    }
  }
}
