import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:threedpass/core/widgets/d3p_scaffold.dart';
import 'package:threedpass/core/widgets/paddings.dart';

class NoNodePage extends StatelessWidget {
  const NoNodePage({super.key});

  @override
  Widget build(final BuildContext context) {
    return D3pScaffold(
      appBarTitle: 'wallet_header_title',
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.cloud_off_outlined,
                size: 64,
                color: Theme.of(context).colorScheme.error,
              ),
              const H16(),
              Text(
                'no_node_error_title'.tr(),
                style: Theme.of(context).textTheme.titleLarge,
                textAlign: TextAlign.center,
              ),
              const H24(),
              Text(
                'no_node_error_hint'.tr(),
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
              // const H16(),
            ],
          ),
        ),
      ),
    );
  }
}
