import 'package:flutter/material.dart';
import 'package:threedpass/core/theme/d3p_special_styles.dart';

class ContactNameText extends StatelessWidget {
  final String name;

  const ContactNameText({required this.name, super.key});

  @override
  Widget build(final BuildContext context) => Padding(
        padding: const EdgeInsets.only(top: 16, right: 16),
        child: Text(
          name,
          style: Theme.of(context).customTextStyles.d3ptitleLarge,
        ),
      );
}
