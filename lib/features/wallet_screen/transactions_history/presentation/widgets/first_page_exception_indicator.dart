import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:threedpass/core/widgets/buttons/elevated_button.dart';
import 'package:threedpass/core/widgets/paddings.dart';

class FirstPageExceptionIndicator extends StatelessWidget {
  const FirstPageExceptionIndicator({
    required this.onTryAgain,
    this.message,
    super.key,
  });

  final VoidCallback onTryAgain;
  final String? message;

  @override
  Widget build(final BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
        child: Column(
          children: [
            Text(
              'first_page_error_title'.tr(),
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const H16(),
            Text(
              message ?? 'first_page_error_message'.tr(),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 48),
            SizedBox(
              height: 50,
              width: double.infinity,
              child: D3pElevatedButton(
                text: 'first_page_error_button'.tr(),
                onPressed: onTryAgain,
                iconData: Icons.refresh,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
