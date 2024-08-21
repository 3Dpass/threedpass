import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:threedpass/core/theme/d3p_special_styles.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    required this.titleUnlocalized,
    super.key,
  });

  final String titleUnlocalized;

  @override
  Widget build(final BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Text(
        titleUnlocalized.tr(),
        style: Theme.of(context).customTextStyles.d3plabelLarge,
      ),
    );
  }
}
