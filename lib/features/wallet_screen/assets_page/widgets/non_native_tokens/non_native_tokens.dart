import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/polkawallet/app_service.dart';
import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';
import 'package:threedpass/core/widgets/paddings.dart';
import 'package:threedpass/core/widgets/progress_indicator/progress_indicator.dart';
import 'package:threedpass/core/widgets/text/d3p_body_medium_text.dart';
import 'package:threedpass/features/poscan_assets/bloc/poscan_assets_cubit.dart';
import 'package:threedpass/features/poscan_assets/domain/entities/poscan_asset_combined.dart';
import 'package:threedpass/features/settings_page/bloc/settings_cubit.dart';
import 'package:threedpass/features/settings_page/domain/entities/global_settings.dart';
import 'package:threedpass/features/wallet_screen/assets_page/widgets/non_native_tokens/assets_card.dart';

class NonNativeTokens extends StatelessWidget {
  const NonNativeTokens({super.key});

  @override
  Widget build(final BuildContext context) {
    return BlocBuilder<SettingsCubit, GlobalSettings>(
      buildWhen: (final previous, final current) =>
          previous.appSettings.showZeroAssets !=
          current.appSettings.showZeroAssets,
      builder: (final context, final settings) {
        return BlocBuilder<AppServiceLoaderCubit, AppService>(
          builder: (final context, final appService) {
            return BlocBuilder<PoscanAssetsCubit, PoscanAssetsState>(
              builder: (final context, final poscanAssetsState) {
                if (poscanAssetsState.isLoading) {
                  return const Padding(
                    padding: EdgeInsets.only(top: 16),
                    child: Align(
                      alignment: Alignment.center,
                      child: D3pProgressIndicator(size: null),
                    ),
                  );
                }

                if (poscanAssetsState.errorMessage.isNotEmpty) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: D3pBodyMediumText(
                        'poscan_asset_page_assets_load_error'.tr(
                          args: [
                            poscanAssetsState.errorMessage,
                          ],
                        ),
                        translate: false,
                        color: Theme.of(context).colorScheme.error,
                      ),
                    ),
                  );
                }

                final showZeroAssets = settings.appSettings.showZeroAssets;
                final resolvedList = _ResolvedTokens(
                  poscanAssetsState.combined,
                  showZeroAssets,
                  appService.keyring.current
                      .address!, // TODO change to some state for read-only view
                ).resolved;

                double listVPadding = 0.0;
                if (resolvedList.isNotEmpty) {
                  listVPadding = 8.0;
                }

                return ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.only(top: listVPadding),
                  itemCount: resolvedList.length,
                  separatorBuilder: (final context, final index) => const H8(),
                  itemBuilder: (final context, final index) =>
                      AssetsCard(resolvedList[index]),
                );
              },
            );
          },
        );
      },
    );
  }
}

class _ResolvedTokens {
  final List<PoscanAssetCombined> initialItems;
  final bool showZeroAssets;
  final String currentAccountAddress;

  _ResolvedTokens(
    this.initialItems,
    this.showZeroAssets,
    this.currentAccountAddress,
  );

  List<PoscanAssetCombined> get resolved {
    if (showZeroAssets) {
      return initialItems;
    }

    final res = <PoscanAssetCombined>[];
    for (final token in initialItems) {
      if (token.hasPositiveBalance ||
          token.poscanAssetData.admin == currentAccountAddress) {
        res.add(token);
      }
    }
    return res;
  }
}

extension _ on PoscanAssetCombined {
  bool get hasPositiveBalance {
    if (poscanAssetBalance == null) {
      return false;
    }

    return poscanAssetBalance!.decodedRawBalance > BigInt.zero;
  }
}
