import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';
import 'package:threedpass/core/widgets/buttons/custom_back_button.dart';
import 'package:threedpass/core/widgets/buttons/icon_button.dart';
import 'package:threedpass/core/widgets/layout/list_view_separated.dart';
import 'package:threedpass/core/widgets/other/padding_16.dart';
import 'package:threedpass/core/widgets/paddings.dart';
import 'package:threedpass/core/widgets/text/d3p_body_medium_text.dart';
import 'package:threedpass/features/asset_conversion/ui/pools_list/bloc/pools_cubit.dart';
import 'package:threedpass/features/asset_conversion/ui/pools_list/presentation/widgets/pool_card.dart';
import 'package:threedpass/router/router.gr.dart';

@RoutePage()
class PoolsPage extends StatelessWidget {
  const PoolsPage({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        // leading:
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const CustomBackButton(),
            Text('pools_page_appbar'.tr()),
            D3pIconButton(
              iconData: Icons.refresh,
              onPressed: () => BlocProvider.of<PoolsCubit>(context).update(
                address: BlocProvider.of<AppServiceLoaderCubit>(context)
                    .state
                    .keyring
                    .current
                    .address!,
              ),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<PoolsCubit, PoolsState>(
        builder: (final context, final state) {
          if (state.isLoading) {
            return Center(
              child: PlatformCircularProgressIndicator(),
            );
          } else if (state.error != null) {
            return Center(child: Padding16(child: Text(state.error!)));
          } else {
            return SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const D3pBodyMediumText('pools_text'),
                    const H16(),
                    ListViewSeparated(
                      separator: const H16(),
                      children:
                          state.pools.map((final e) => PoolCard(e)).toList(),
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: 'create_pool',
        child: const Icon(Icons.add),
        onPressed: () => context.router.push(const CreatePoolRouteWrapper()),
      ),
    );
  }
}
