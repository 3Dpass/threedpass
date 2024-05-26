import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:threedpass/core/widgets/paddings.dart';
import 'package:threedpass/core/widgets/text/d3p_body_medium_text.dart';

class FormOption extends StatefulWidget {
  const FormOption({
    required this.buildChildren,
    required this.initialValue,
    required this.titleLocalizeKey,
    this.onChanged,
    super.key,
  });

  final bool initialValue;
  final String titleLocalizeKey;
  final List<Widget> Function(bool) buildChildren;
  final void Function(bool)? onChanged;

  @override
  State<StatefulWidget> createState() => _FormOptionState();
}

class _FormOptionState extends State<FormOption> {
  // bool isChecked = false;
  late final ValueNotifier<bool> valueListenable;

  @override
  void initState() {
    valueListenable = ValueNotifier<bool>(widget.initialValue);
    valueListenable.addListener(() {
      widget.onChanged?.call(valueListenable.value);
    });
    super.initState();
  }

  @override
  Widget build(final BuildContext context) {
    final divColor = Theme.of(context).dividerColor;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // D3p
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            D3pBodyMediumText(widget.titleLocalizeKey),
            SizedBox(
              height: 16,
              child: ValueListenableBuilder(
                valueListenable: valueListenable,
                builder: (final context, final hasError, final child) =>
                    PlatformSwitch(
                  value: valueListenable.value,
                  onChanged: (final p0) => valueListenable.value = p0,
                ),
              ),
            ),
          ],
        ),
        Flexible(
          child: ValueListenableBuilder(
            valueListenable: valueListenable,
            builder: (final context, final hasError, final child) {
              if (!valueListenable.value) {
                return const SizedBox.shrink();
              }

              final children = widget.buildChildren(valueListenable.value);

              return Container(
                decoration: BoxDecoration(
                  border: Border(
                    left: BorderSide(
                      color: divColor,
                      width: 2.0,
                    ),
                  ),
                ),
                child: ListView.separated(
                  padding: const EdgeInsets.only(top: 16, left: 8),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: children.length,
                  separatorBuilder: (final context, final index) =>
                      const SizedBoxH16(),
                  itemBuilder: (final context, final index) => Row(
                    children: [
                      Flexible(
                        child: children[index],
                      ),
                    ],
                  ),
                ),
              );
            },
            // widget.buildChild(valueListenable.value),
          ),
        ),
      ],
    );
  }
}
