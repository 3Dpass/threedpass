import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class ListTileButton extends StatelessWidget {
  const ListTileButton({
    Key? key,
    this.onPressed,
    required this.text,
  }) : super(key: key);

  final void Function()? onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return PlatformTextButton(
      padding: EdgeInsets.zero,

      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text),
          const Icon(Icons.arrow_right_outlined),
        ],
      ),
      // TODO Check cupertino theme
      material: (context, platform) => MaterialTextButtonData(
        style: Theme.of(context).textButtonTheme.style!.copyWith(
              // padding: MaterialStateProperty.all(EdgeInsets.zero),
              backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
      ),
    );
  }
}
