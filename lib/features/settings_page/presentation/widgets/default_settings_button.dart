// ignore_for_file: prefer-single-widget-per-file
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:threedpass/core/theme/d3p_special_styles.dart';
import 'package:threedpass/core/widgets/buttons/clickable_card.dart';
import 'package:threedpass/core/widgets/d3p_card.dart';
import 'package:threedpass/core/widgets/other/padding_16.dart';
import 'package:threedpass/core/widgets/other/right_chevron.dart';
import 'package:threedpass/core/widgets/paddings.dart';

abstract class _LineBasicRight extends StatelessWidget {
  const _LineBasicRight({super.key});
}

class LineButtonRightValue extends _LineBasicRight {
  const LineButtonRightValue({
    required this.chevronColor,
    required this.value,
    super.key,
  });

  final Color chevronColor;
  final String value;

  @override
  Widget build(final BuildContext context) {
    final style = Theme.of(context).customTextStyles.fadedBodyMedium;
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 16, right: value.isNotEmpty ? 8 : 0),
          child: Text(
            value,
            style: style,
            textAlign: TextAlign.end,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        RightChevron(color: chevronColor),
      ],
    );
  }
}

class LineButtonRightBool extends _LineBasicRight {
  const LineButtonRightBool({
    required this.onChange,
    required this.value,
    super.key,
  });

  final bool value;
  final void Function(bool) onChange;

  @override
  Widget build(final BuildContext context) {
    return Switch.adaptive(
      value: value,
      onChanged: onChange,
    );
  }
}

class LineButton extends StatelessWidget {
  final VoidCallback? onBasePressed;
  final _LineBasicRight goToBasicRight;
  final Widget icon;
  final String localization_key;
  final CardShape cardShape;

  const LineButton({
    required this.onBasePressed,
    required this.icon,
    required this.localization_key,
    required this.goToBasicRight,
    required this.cardShape,
    super.key,
  });

  @override
  Widget build(final BuildContext context) {
    final child = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            icon,
            const W8(),
            Text(localization_key.tr()),
          ],
        ),
        goToBasicRight,
      ],
    );

    return onBasePressed != null
        ? ClickableCard(
            onTap: onBasePressed,
            cardShape: cardShape,
            child: child,
          )
        : D3pCard(
            cardShape: cardShape,
            child: Padding16(
              child: child,
            ),
          );
  }
}
