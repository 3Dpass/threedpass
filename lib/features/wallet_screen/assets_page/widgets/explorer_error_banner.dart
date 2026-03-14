import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/features/rest/bloc/explorer_url_cubit.dart';

class ExplorerErrorBanner extends StatelessWidget {
  const ExplorerErrorBanner({super.key});

  @override
  Widget build(final BuildContext context) {
    return BlocBuilder<ExplorerUrlCubit, ExplorerUrlState>(
      buildWhen: (final previous, final current) =>
          previous.hasError != current.hasError,
      builder: (final context, final state) {
        if (!state.hasError) {
          return const SizedBox.shrink();
        }

        final colorScheme = Theme.of(context).colorScheme;

        return Container(
          width: double.infinity,
          color: colorScheme.errorContainer,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          margin: const EdgeInsets.only(left: 16, right: 16, top: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.warning_amber_rounded,
                    color: colorScheme.onErrorContainer,
                    size: 20,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'explorer_error_banner_title'.tr(),
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: colorScheme.onErrorContainer,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ],
              ),
              const SizedBox(height: 6),
              Text(
                'explorer_error_banner_body'.tr(),
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: colorScheme.onErrorContainer,
                    ),
              ),
            ],
          ),
        );
      },
    );
  }
}
