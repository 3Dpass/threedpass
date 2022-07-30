import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:threedpass/features/accounts/bloc/advanced_options_from_bloc.dart';

class TextControllerBuilder extends StatefulWidget {
  const TextControllerBuilder({
    Key? key,
    required this.child,
    required this.controller,
  }) : super(key: key);

  final TextEditingController controller;
  final Widget child;

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<TextControllerBuilder> {
  @override
  void initState() {
    widget.controller.addListener(() => setState(() {
          final formBloc = context.read<AdvancedOptionsFromBloc>();
          formBloc.resetForm();
        }));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('bui;d');
    return widget.child;
  }
}
