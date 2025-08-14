import 'package:flutter/material.dart';
import 'package:threedpass/core/widgets/d3p_card.dart';

class FormFieldCard extends StatelessWidget {
  final String fieldName;
  final Widget child;

  const FormFieldCard({
    required this.fieldName,
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return D3pCard(
      cardShape: CardShape.all,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          spacing: 16,
          children: [
            Text(
              fieldName,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            child,
          ],
        ),
      ),
    );
  }
}
