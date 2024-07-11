import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:threedpass/core/theme/d3p_special_colors.dart';
import 'package:threedpass/core/theme/d3p_theme.dart';

class EnumButton extends StatelessWidget {
  const EnumButton({
    required this.text,
    required this.isChosen,
    final Key? key,
    this.onPressed,
    this.padding,
    this.child,
  })  : border = const RoundedRectangleBorder(),
        assert(
          child != null || text != null,
          'Either child or text must be provided',
        ),
        super(key: key);

  static const buttonRadius = Radius.circular(8);

  final void Function()? onPressed;
  final RoundedRectangleBorder border;
  final String? text;
  final EdgeInsetsGeometry? padding;
  final bool isChosen;
  final Widget? child;

  @override
  Widget build(final BuildContext context) {
    final theme = Theme.of(context);
    final mainColor =
        onPressed != null ? D3pThemeData.mainColor : theme.disabledColor;

    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: SizedBox(
        child: PlatformTextButton(
          onPressed: onPressed,
          child: Row(
            children: [
              _Icon(
                isEmpty: !isChosen,
              ),
              Flexible(
                child: child != null
                    ? child!
                    : Text(
                        text ?? ''
                      ),
              ),
              // placeholder to make flexible centered
              const _Icon(
                isEmpty: true,
              ),
            ],
          ),
          material: (final context, final platform) => MaterialTextButtonData(
            style: theme.textButtonTheme.style!.copyWith(
              foregroundColor: MaterialStateProperty.all(
                isChosen ? mainColor : theme.customColors.themeOpposite,
              ),
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              shape: MaterialStateProperty.all<OutlinedBorder>(border),
            ),
          ),
          cupertino: (final context, final platform) =>
              _CupertinoTextButtonData(),
        ),
      ),
    );
  }
}

class _Icon extends StatelessWidget {
  final bool isEmpty;

  const _Icon({required this.isEmpty});

  @override
  Widget build(final BuildContext context) {
    return Icon(
      Icons.chevron_right_outlined,
      color: isEmpty ? Colors.transparent : null,
    );
  }
}

class _CupertinoTextButtonData extends CupertinoTextButtonData {
  _CupertinoTextButtonData()
      : super(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        );
}
