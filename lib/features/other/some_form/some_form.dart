import 'package:flutter/material.dart';
import 'package:threedpass/core/widgets/d3p_scaffold.dart';
import 'package:threedpass/core/widgets/paddings.dart';

class SomeForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final String appbarTitle;
  final List<Widget> children;
  final Widget submitButton;

  const SomeForm({
    required this.formKey,
    required this.appbarTitle,
    required this.children,
    required this.submitButton,
    super.key,
  });

  @override
  Widget build(final BuildContext context) {
    // final textStyle = Theme.of(context).customTextStyles;

    final widgets = <Widget>[
      ...children,
      Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // TODO Some warning about fees
            // Text(
            //   'Transaction takes fees',
            //   style: textStyle.secondaryText,
            // ),
            submitButton,
          ],
        ),
      ),
    ];
    return D3pScaffold(
      appbarTitle: appbarTitle,
      body: Form(
        key: formKey,
        child: ListView.separated(
          padding: const EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 16,
          ),
          shrinkWrap: true,
          separatorBuilder: (final context, final index) => const H16(),
          itemBuilder: (final context, final index) => widgets[index],
          itemCount: widgets.length,
        ),
      ),
    );
  }
}
