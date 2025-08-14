import 'package:flutter/material.dart';
import 'package:threedpass/core/widgets/buttons/custom_back_button.dart';
import 'package:threedpass/core/widgets/d3p_scaffold.dart';
import 'package:threedpass/core/widgets/paddings.dart';

class SomeForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final String appbarTitle;
  final List<Widget> children;
  final Widget submitButton;
  final double horizontalPadding;

  /// Field for buttons list or something we don't actually need to validate.
  /// If this is included into a Column inside Form,
  /// then the whole Form is never validate (always returns valid)
  final List<Widget> afterForm;

  const SomeForm({
    required this.formKey,
    required this.appbarTitle,
    required this.children,
    required this.submitButton,
    this.afterForm = const [],
    this.horizontalPadding = 16,
    super.key,
  });

  @override
  Widget build(final BuildContext context) {
    return D3pScaffold(
      appBarLeading: const CustomBackButton(),
      appBarTitle: appbarTitle,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding,
            vertical: 16,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: Form(
                  key: formKey,
                  child: Column(
                    spacing: 16,
                    children: children,
                    crossAxisAlignment: CrossAxisAlignment.start,
                  ),
                ),
              ),
              const H16(),
              Column(
                spacing: 16,
                children: afterForm,
                crossAxisAlignment: CrossAxisAlignment.start,
              ),
              const H24(),
              submitButton,
            ],
          ),
        ),
      ),
    );
  }
}
