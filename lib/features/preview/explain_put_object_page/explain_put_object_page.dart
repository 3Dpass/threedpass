import 'package:auto_route/annotations.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/polkawallet/app_service.dart';
import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';
import 'package:threedpass/core/widgets/d3p_scaffold.dart';
import 'package:threedpass/features/hashes_list/domain/entities/snapshot.dart';
import 'package:threedpass/features/preview/preview_page/bloc/preview_page_cubit.dart';
import 'package:threedpass/features/settings_page/domain/entities/scan_settings.dart';

@RoutePage()
class ExplainPutObjectPage extends StatelessWidget {
  const ExplainPutObjectPage({super.key});

  @override
  Widget build(final BuildContext context) {
    return BlocBuilder<AppServiceLoaderCubit, AppService>(
      builder: (final context, final appState) {
        return BlocBuilder<PreviewPageCubit, Snapshot>(
          builder: (final context, final snap) {
            final isNodeConnected =
                appState.status == AppServiceInitStatus.connected;
            final hasAccount = appState.keyring.allAccounts.isNotEmpty;
            final scanSucceeded = !snap.scanFailed;
            final isCorrectAlgorithm =
                snap.settingsConfig.algorithm == ScanSettings.scanAlgorithm;
            final isCorrectGridSize =
                snap.settingsConfig.gridSize == ScanSettings.scanGridSize;
            final isCorrectNSections =
                snap.settingsConfig.nSections == ScanSettings.scanNsections;
            final isNoneTransBytes =
                snap.settingsConfig.transBytesMode == TransBytesMode.none;

            return D3pScaffold(
              appBarTitle: 'upload_req_page_title',
              body: ListView(
                padding: const EdgeInsets.symmetric(vertical: 8),
                children: [
                  _ConditionRow(
                    label: 'upload_req_node_connected'.tr(),
                    passed: isNodeConnected,
                  ),
                  _ConditionRow(
                    label: 'upload_req_has_account'.tr(),
                    passed: hasAccount,
                  ),
                  _ConditionRow(
                    label: 'upload_req_scan_succeeded'.tr(),
                    passed: scanSucceeded,
                  ),
                  _ConditionRow(
                    label: 'upload_req_algorithm'
                        .tr(args: [ScanSettings.scanAlgorithm]),
                    passed: isCorrectAlgorithm,
                    currentValue: snap.settingsConfig.algorithm,
                    requiredValue: ScanSettings.scanAlgorithm,
                  ),
                  _ConditionRow(
                    label: 'upload_req_grid_size'
                        .tr(args: [ScanSettings.scanGridSize.toString()]),
                    passed: isCorrectGridSize,
                    currentValue: snap.settingsConfig.gridSize.toString(),
                    requiredValue: ScanSettings.scanGridSize.toString(),
                  ),
                  _ConditionRow(
                    label: 'upload_req_n_sections'
                        .tr(args: [ScanSettings.scanNsections.toString()]),
                    passed: isCorrectNSections,
                    currentValue: snap.settingsConfig.nSections.toString(),
                    requiredValue: ScanSettings.scanNsections.toString(),
                  ),
                  _ConditionRow(
                    label: 'upload_req_trans_bytes_none'.tr(),
                    passed: isNoneTransBytes,
                    currentValue: snap.settingsConfig.transBytesMode.name,
                    requiredValue: TransBytesMode.none.name,
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}

class _ConditionRow extends StatelessWidget {
  final String label;
  final bool passed;
  final String? currentValue;
  final String? requiredValue;

  const _ConditionRow({
    required this.label,
    required this.passed,
    this.currentValue,
    this.requiredValue,
  });

  @override
  Widget build(final BuildContext context) {
    final errorColor = Theme.of(context).colorScheme.error;
    const passColor = Colors.green;
    final color = passed ? passColor : errorColor;

    final showMismatch = !passed && currentValue != null;

    return ListTile(
      leading: Icon(
        passed ? Icons.check_circle_outline : Icons.cancel_outlined,
        color: color,
      ),
      title: Text(label),
      subtitle: showMismatch
          ? Text(
              'upload_req_mismatch_hint'.tr(
                args: [currentValue!, requiredValue!],
              ),
              style: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(color: errorColor),
            )
          : null,
    );
  }
}
