import 'package:flutter/material.dart';
import 'package:threedpass/core/widgets/buttons/text_button.dart';
import 'package:threedpass/features/common/link_to_page/entities/link_to_page_params.dart';

class BasicLinkToPage extends StatelessWidget {
  const BasicLinkToPage({
    required this.params,
    super.key,
  });

  final LinkToPageParams params;

  @override
  Widget build(final BuildContext context) {
    return D3pTextButton(
      text: params.title,
      onPressed: params.onPressed,
      flexibleText: false,
      icon: Icons.arrow_forward,
      iconAlignment: IconAlignment.end,
    );
  }
}
