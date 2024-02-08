// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:threedpass/core/theme/d3p_elevated_button_theme.dart';
// import 'package:threedpass/core/theme/d3p_special_styles.dart';

// class D3pFloatingActionButton extends StatelessWidget {
//   const D3pFloatingActionButton({
//     required this.onPressed,
//     required this.icons,
//     required this.text,
//     required this.heroTag,
//     super.key,
//   });

//   final void Function()? onPressed;
//   final IconData icons;
//   final String text;
//   final String heroTag;

//   Set<MaterialState> calcSets() {
//     final disableSets = {MaterialState.disabled};
//     return onPressed != null ? {} : disableSets;
//   }

//   @override
//   Widget build(final BuildContext context) {
//     final theme = Theme.of(context);
//     final style = theme.customTextStyles.d3pFloatingButton;
//     final buttonTheme = D3pElevatedButtonTheme.theme(theme);

//     final bgColor = buttonTheme.style!.backgroundColor!.resolve(calcSets());
//     final fgColor = buttonTheme.style!.foregroundColor!.resolve(calcSets());
//     return FloatingActionButton.extended(
//       heroTag: heroTag,
//       backgroundColor: bgColor,
//       foregroundColor: fgColor,
//       elevation: 2,
//       disabledElevation: 0,
//       shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.all(Radius.circular(4.0)),
//       ),
//       icon: Icon(icons),
//       label: Text(
//         text.tr(),
//         style: style.copyWith(color: fgColor),
//       ),
//       onPressed: onPressed,
//     );
//   }
// }
