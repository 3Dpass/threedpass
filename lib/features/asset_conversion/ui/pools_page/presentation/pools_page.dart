import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';
import 'package:threedpass/core/widgets/buttons/custom_back_button.dart';
import 'package:threedpass/core/widgets/buttons/icon_button.dart';
import 'package:threedpass/core/widgets/layout/list_view_separated.dart';
import 'package:threedpass/core/widgets/paddings.dart';
import 'package:threedpass/features/asset_conversion/ui/pools_page/bloc/pools_cubit.dart';
import 'package:threedpass/features/asset_conversion/ui/pools_page/presentation/widgets/pool_card.dart';
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
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Earn fees by providing liquidity.'),
              SizedBoxH16(),
              ListViewSeparated(
                children: ['1', '2', '3'].map((e) => PoolCard()).toList(),
                separator: SizedBoxH16(),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: 'create_pool',
        child: const Icon(Icons.add),
        onPressed: () => context.router.push(const CreatePoolRoute()),
      ),
    );
  }
}
