import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:threedpass/core/theme/d3p_card_theme.dart';
import 'package:threedpass/core/theme/d3p_colors.dart';
import 'package:threedpass/core/theme/d3p_special_colors.dart';
import 'package:threedpass/core/theme/d3p_special_styles.dart';
import 'package:threedpass/core/utils/empty_function.dart';
import 'package:threedpass/core/widgets/d3p_card.dart';
import 'package:threedpass/core/widgets/other/right_chevron.dart';
import 'package:threedpass/core/widgets/text/d3p_body_medium_text.dart';

class DefaultSettingsButton extends StatelessWidget {
  // ignore: unused_element
  const DefaultSettingsButton({
    required this.iconColor,
    required this.iconData,
    required this.text,
    required this.isBoolean,
    required this.onPressedBool,
    required this.textValue,
    required this.initialValue,
    required this.cardShape,
    required this.isChevronGrey,
    this.customSuffixButton,
    this.onPressed,
    super.key,
  });

  const DefaultSettingsButton.openButton({
    required this.iconColor,
    required this.iconData,
    required this.text,
    required this.cardShape,
    this.onPressed,
    this.textValue,
    this.isChevronGrey = true,
    super.key,
  })  : isBoolean = false,
        initialValue = null,
        customSuffixButton = null,
        onPressedBool = emptyBoolFunction;

  const DefaultSettingsButton.boolean({
    required this.iconColor,
    required this.iconData,
    required this.text,
    required this.initialValue,
    required this.onPressedBool,
    required this.cardShape,
    this.isChevronGrey = true,
    super.key,
  })  : isBoolean = true,
        onPressed = emptyFunction,
        customSuffixButton = null,
        textValue = null;

  final IconData iconData;
  final Color iconColor;
  final String text;
  final String? textValue;
  final void Function()? onPressed;
  final bool isBoolean;
  final bool? initialValue;
  final void Function(bool) onPressedBool;
  final CardShape cardShape;
  final bool isChevronGrey;
  final Widget? customSuffixButton;

  @override
  Widget build(final BuildContext context) {
    return _WrapCard(
      _ArgumentsDTO(
        iconColor: iconColor,
        iconData: iconData,
        text: text,
        isBoolean: isBoolean,
        onPressedBool: onPressedBool,
        textValue: textValue,
        initialValue: initialValue,
        onPressed: onPressed,
        cardShape: cardShape,
        isChevronGrey: isChevronGrey,
        customSuffixButton: customSuffixButton,
      ),
    );
  }
}

class _ArgumentsDTO {
  const _ArgumentsDTO({
    required this.iconColor,
    required this.iconData,
    required this.text,
    required this.isBoolean,
    required this.onPressedBool,
    required this.textValue,
    required this.initialValue,
    required this.onPressed,
    required this.cardShape,
    required this.isChevronGrey,
    required this.customSuffixButton,
  });

  final IconData iconData;
  final Color iconColor;
  final String text;
  final String? textValue;
  final bool isBoolean;
  final bool? initialValue;
  final void Function(bool) onPressedBool;
  final void Function()? onPressed;
  final CardShape cardShape;
  final bool isChevronGrey;
  final Widget? customSuffixButton;
}

class _WrapCard extends StatelessWidget {
  const _WrapCard(this.args);

  final _ArgumentsDTO args;

  @override
  Widget build(final BuildContext context) {
    final wrappedInkWell = _WrappedInkWellBase(args);

    switch (Theme.of(context).platform) {
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
        return wrappedInkWell;
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
          child: wrappedInkWell,
        );
      // return _IOSSettingsIcon(iconColor: iconColor, iconData: iconData);
    }
  }
}

class _WrappedInkWellBase extends StatelessWidget {
  const _WrappedInkWellBase(this.args);

  final _ArgumentsDTO args;

  @override
  Widget build(final BuildContext context) {
    final child = _ButtonBase(args);

    final bottomRadius =
        args.cardShape == CardShape.bottom || args.cardShape == CardShape.all
            ? D3pCardTheme.radius
            : Radius.zero;

    final topRadius =
        args.cardShape == CardShape.top || args.cardShape == CardShape.all
            ? D3pCardTheme.radius
            : Radius.zero;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: D3pCard(
        cardShape: args.cardShape,
        child: args.isBoolean
            ? child
            : InkWell(
                onTap: args.onPressed != null ? () => args.onPressed!() : null,
                borderRadius: BorderRadius.only(
                  bottomLeft: bottomRadius,
                  bottomRight: bottomRadius,
                  topLeft: topRadius,
                  topRight: topRadius,
                ),
                child: child,
              ),
      ),
    );
  }
}

class _ButtonBase extends StatelessWidget {
  const _ButtonBase(this.args);

  final _ArgumentsDTO args;

  @override
  Widget build(final BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      child: _SettingsButtonContent(
        args: args,
      ),
    );
  }
}

class _SettingsButtonContent extends StatelessWidget {
  const _SettingsButtonContent({
    required this.args,
  });

  final _ArgumentsDTO args;

  @override
  Widget build(final BuildContext context) {
    return SizedBox(
      height: 24,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _SettingsIcon(iconColor: args.iconColor, iconData: args.iconData),
              const SizedBox(width: 16),
              D3pBodyMediumText(args.text),
            ],
          ),
          _SuffixWidget(
            args: args,
          ),
        ],
      ),
    );
  }
}

class _SuffixWidget extends StatelessWidget {
  const _SuffixWidget({
    required this.args,
  });
  final _ArgumentsDTO args;

  @override
  Widget build(final BuildContext context) {
    if (args.customSuffixButton != null) {
      return Flexible(
        child: Row(
          children: [
            _ValueText(
              value: args.textValue,
            ),
            args.customSuffixButton!,
          ],
        ),
      );
    }
    if (args.isBoolean) {
      return _BoolSwitch(
        value: args.initialValue!,
        onChanged: args.onPressedBool,
      );
    }

    final colors = Theme.of(context).customColors;
    final chevronColor = args.isChevronGrey ? colors.moreFadedGrey : null;
    return Flexible(
      child: _Value(
        value: args.textValue,
        chevronColor: chevronColor,
      ),
    );
  }
}

class _BoolSwitch extends StatelessWidget {
  final bool value;
  final void Function(bool) onChanged;

  _BoolSwitch({
    required this.value,
    required this.onChanged,
  }) : switchValueNotifier = ValueNotifier<bool>(value);

  final ValueNotifier<bool> switchValueNotifier;

  @override
  Widget build(final BuildContext context) {
    return SizedBox(
      height: 16,
      child: ValueListenableBuilder(
        valueListenable: switchValueNotifier,
        builder: (final context, final hasError, final child) => PlatformSwitch(
          value: switchValueNotifier.value,
          onChanged: onChangedInner,
        ),
      ),
    );
  }

  void onChangedInner(final bool p0) {
    onChanged(p0);
    switchValueNotifier.value = p0;
  }
}

class _Value extends StatelessWidget {
  const _Value({
    required this.value,
    required this.chevronColor,
  });
  final String? value;
  final Color? chevronColor;

  @override
  Widget build(final BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (value != null)
          Flexible(
            child: _ValueText(value: value),
          ),
        RightChevron(color: chevronColor),
      ],
    );
  }
}

class _SettingsIcon extends StatelessWidget {
  const _SettingsIcon({
    required this.iconColor,
    required this.iconData,
  });

  final IconData iconData;
  final Color iconColor;

  @override
  Widget build(final BuildContext context) {
    switch (Theme.of(context).platform) {
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
        return _AndroidSettingsIcon(iconColor: iconColor, iconData: iconData);
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
        return _IOSSettingsIcon(iconColor: iconColor, iconData: iconData);
    }
  }
}

class _AndroidSettingsIcon extends StatelessWidget {
  const _AndroidSettingsIcon({
    required this.iconColor,
    required this.iconData,
  });

  final IconData iconData;
  final Color iconColor;

  @override
  Widget build(final BuildContext context) {
    return Icon(iconData, color: iconColor);
  }
}

class _IOSSettingsIcon extends StatelessWidget {
  const _IOSSettingsIcon({
    required this.iconColor,
    required this.iconData,
  });

  final IconData iconData;
  final Color iconColor;

  @override
  Widget build(final BuildContext context) {
    return Container(
      child: Icon(iconData),
    );
  }
}

class _ValueText extends StatelessWidget {
  const _ValueText({
    required this.value,
  });

  final String? value;

  @override
  Widget build(final BuildContext context) {
    if (value != null) {
      final style = Theme.of(context).customTextStyles.d3pBodyMedium.copyWith(
            color: D3pColors.disabled,
          );
      return Padding(
        padding: const EdgeInsets.only(left: 16, right: 8),
        child: Text(
          value!,
          style: style,
          textAlign: TextAlign.end,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      );
    } else {
      return const SizedBox();
    }
  }
}
