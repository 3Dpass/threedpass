import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';
import 'package:threedpass/core/widgets/buttons/custom_back_button.dart';
import 'package:threedpass/core/widgets/buttons/disable_refresh_button.dart';
import 'package:threedpass/core/widgets/d3p_scaffold.dart';
import 'package:threedpass/core/widgets/layout/separated_column.dart';
import 'package:threedpass/core/widgets/other/ph16.dart';
import 'package:threedpass/core/widgets/paddings.dart';
import 'package:threedpass/core/widgets/progress_indicator/progress_indicator.dart';
import 'package:threedpass/core/widgets/text/d3p_body_medium_text.dart';
import 'package:threedpass/features/asset_conversion/ui/pools_list/bloc/pools_cubit.dart';
import 'package:threedpass/features/asset_conversion/ui/pools_list/presentation/widgets/pool_card.dart';

@RoutePage()
class PoolsPage extends StatelessWidget {
  const PoolsPage({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    return D3pScaffold(
      appBarLeading: const CustomBackButton(),
      appBarTitle: 'pools_page_appbar',
      appBarActions: [
        DisableRefreshButton(
          onPressed: () => BlocProvider.of<PoolsCubit>(context).update(
            address: BlocProvider.of<AppServiceLoaderCubit>(context)
                .state
                .keyring
                .current
                .address!,
          ),
        ),
      ],
      body: BlocBuilder<PoolsCubit, PoolsState>(
        builder: (final context, final state) {
          if (state.hasError) {
            return Center(
              child: PH16(
                child: Text(
                  state.error.toString(),
                ),
              ),
            );
          } else if (state.hasValue) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const D3pBodyMediumText('pools_text'),
                    const H16(),
                    SeparatedColumn(
                      children: state.value!.pools
                          .map((final e) => PoolCard(e))
                          .toList(),
                      separator: const H16(),
                    ),
                    const H16(),
                    if (state.isLoading)
                      const Padding(
                        padding: EdgeInsets.only(bottom: 16),
                        child: D3pProgressIndicator(size: null),
                      ),
                  ],
                ),
              ),
            );
          } else {
            return const D3pProgressIndicator(size: null);
          }
        },
      ),
    );
  }
}
