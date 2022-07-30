import 'package:flutter/material.dart';

class FormedTextField extends StatelessWidget {
  const FormedTextField({
    Key? key,
    required this.controller,
    required this.formKey,
    required this.validator,
  }) : super(key: key);

  final GlobalKey<FormState> formKey;
  final TextEditingController controller;
  final String? Function(String?) validator;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: TextFormField(
        controller: controller,
        validator: validator,
      ),
    );
  }
}
