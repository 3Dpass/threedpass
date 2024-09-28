import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:threedpass/core/widgets/buttons/elevated_button.dart';
import 'package:threedpass/features/accounts/presentation/widgets/mnemonic_text_field.dart';
import 'package:threedpass/router/router.gr.dart';

class MnemonicBackupContent extends StatelessWidget {
  const MnemonicBackupContent({
    required this.mnemonic,
    final Key? key,
  }) : super(key: key);

  final String mnemonic;

  @override
  Widget build(final BuildContext context) {
    final textStyles = Theme.of(context).textTheme;
    return SafeArea(
      child: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(16),
        shrinkWrap: true,
        children: [
          const SizedBox(height: 16),
          Text(
            'backup_warn1_header'.tr(),
            style: textStyles.titleLarge!.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Text(
            'backup_warn1_text'.tr(),
            style: textStyles.bodyMedium,
          ),
          const SizedBox(height: 12),
          MnemonicTextField(text: mnemonic),
          const SizedBox(height: 12),
          D3pElevatedButton(
            onPressed: () async => context.router.push(
              const CreateAccountMnemonicConfirmRoute(),
            ),
            text: 'Next'.tr(),
          ),
        ],
      ),
    );
  }
}
