import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:threedpass/core/polkawallet/app_service.dart';
import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';
import 'package:threedpass/core/theme/d3p_theme.dart';
import 'package:threedpass/core/widgets/text/d3p_body_medium_text.dart';
import 'package:threedpass/features/poscan_assets/bloc/poscan_assets_cubit.dart';
import 'package:threedpass/features/poscan_assets/domain/entities/poscan_asset_combined.dart';
import 'package:threedpass/features/settings_page/bloc/settings_page_cubit.dart';
import 'package:threedpass/features/settings_page/domain/entities/global_settings.dart';
import 'package:threedpass/features/wallet_screen/assets_page/widgets/non_native_tokens/assets_card.dart';

class NonNativeTokens extends StatelessWidget {
  const NonNativeTokens({super.key});

  @override
  Widget build(final BuildContext context) {
    return BlocBuilder<SettingsConfigCubit, GlobalSettings>(
      buildWhen: (final previous, final current) =>
          previous.appSettings.showZeroAssets !=
          current.appSettings.showZeroAssets,
      builder: (final context, final settings) {
        return BlocBuilder<AppServiceLoaderCubit, AppService>(
          builder: (final context, final appService) {
            return BlocBuilder<PoscanAssetsCubit, PoscanAssetsState>(
              builder: (final context, final poscanAssetsState) {
                if (poscanAssetsState.isLoading) {
                  return PlatformCircularProgressIndicator();
                }

                if (poscanAssetsState.errorMessage.isNotEmpty) {
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: D3pBodyMediumText(
                        'poscan_asset_page_assets_load_error'.tr(
                          args: [
                            poscanAssetsState.errorMessage,
                          ],
                        ),
                        translate: false,
                        color: Colors.red,
                      ),
                    ),
                  ); // TODO Red color
                }
                // TODO show tokens where user is admin
                final showZeroAssets = settings.appSettings.showZeroAssets;
                final resolvedList =
                    _ResolvedTokens(poscanAssetsState.combined, showZeroAssets)
                        .resolved;

                double listVPadding = 0.0;
                if (resolvedList.isNotEmpty) {
                  listVPadding = 8.0;
                }

                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(vertical: listVPadding),
                  itemCount: resolvedList.length,
                  itemBuilder: (final context, final index) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: AssetsCard(resolvedList[index]),
                  ),
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

  _ResolvedTokens(
    this.initialItems,
    this.showZeroAssets,
  );

  List<PoscanAssetCombined> get resolved {
    if (showZeroAssets) {
      return initialItems;
    }

    // final res = <PoscanAssetCombined>[];
    // for (final token in initialTokens) {
    //   if (token.isAmountPositive) {
    //     res.add(token);
    //   }
    // }
    return initialItems;
  }
}
