import 'package:flutter/material.dart';
import 'package:threedpass/core/widgets/buttons/enum_button.dart';

class EnumButtonsList extends StatelessWidget {
  final int length;
  final EnumButton Function(BuildContext, int) itemBuilder;

  const EnumButtonsList({
    required this.length,
    required this.itemBuilder,
    super.key,
  });

  @override
  Widget build(final BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: length,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: itemBuilder,
    );
  }
}
