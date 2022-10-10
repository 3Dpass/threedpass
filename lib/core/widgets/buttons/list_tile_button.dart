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
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: SizedBox(
        child: PlatformTextButton(
          onPressed: onPressed,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(text),
              const Icon(Icons.arrow_right_outlined),
            ],
          ),
          // TODO Check cupertino theme
          material: (final context, final platform) => MaterialTextButtonData(
            style: Theme.of(context).textButtonTheme.style!.copyWith(
                  // padding: MaterialStateProperty.all(EdgeInsets.zero),
                  backgroundColor: MaterialStateProperty.all<Color>(
                    backgroundColor ?? Colors.white,
                  ),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  shape: MaterialStateProperty.all<OutlinedBorder>(border),
                ),
          ),
        ),
      ),
    );
  }
}
