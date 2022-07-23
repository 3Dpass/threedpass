import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/polkawallet/app_service.dart';
import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';
import 'package:threedpass/features/wallet_page/presentation/widgets/asset_page/asset_page_appbar.dart';

class AssetsPage extends StatelessWidget {
  const AssetsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppServiceLoaderCubit, Object>(
      builder: (context, state) {
        // Other states are impossible. The check is completed in [WalletPage]
        final appService = state as AppService;

        return Scaffold(
          appBar: AssetPageAppbar(
            account: appService.keyring.current,
            context: context,
          ),
        );
      },
    );
  }
}
