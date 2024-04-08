import 'package:flutter/material.dart';
import 'package:threedpass/core/widgets/d3p_scaffold.dart';
import 'package:threedpass/core/widgets/paddings.dart';

class SomeForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final String appbarTitle;
  final List<Widget> children;

  const SomeForm({
    required this.formKey,
    required this.appbarTitle,
    required this.children,
    super.key,
  });

  @override
  Widget build(final BuildContext context) {
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
          separatorBuilder: (final context, final index) => const SizedBoxH16(),
          itemBuilder: (final context, final index) => children[index],
          itemCount: children.length,
        ),
      ),
    );
  }
}
