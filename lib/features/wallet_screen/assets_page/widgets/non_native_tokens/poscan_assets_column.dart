import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/widgets/buttons/icon_button.dart';
import 'package:threedpass/core/widgets/buttons/secondary_button.dart';
import 'package:threedpass/core/widgets/paddings.dart';
import 'package:threedpass/core/widgets/text/d3p_title_large_text.dart';
import 'package:threedpass/features/poscan_assets/bloc/poscan_assets_cubit.dart';
import 'package:threedpass/features/wallet_screen/assets_page/widgets/non_native_tokens/non_native_tokens.dart';
import 'package:threedpass/router/router.gr.dart';

class PoscanAssetsColumn extends StatelessWidget {
  const PoscanAssetsColumn({super.key});

  @override
  Widget build(final BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const D3pTitleLargeText('assets_title'),
              D3pIconButton(
                iconData: Icons.refresh,
                onPressed: () =>
                    BlocProvider.of<PoscanAssetsCubit>(context).init(),
              ),
            ],
          ),
          D3pSecondaryButton(
            localizedTextKey: 'create_asset_button_label',
            iconData: Icons.generating_tokens,
            onPressed: () =>
                context.router.push(const CreateAssetRouteWrapper()),
          ),
          const Flexible(
            child: NonNativeTokens(),
          ),
        ],
      ),
    );
  }
}
