import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/polkawallet/app_service.dart';
import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';
import 'package:threedpass/features/wallet_screen/presentation/widgets/asset_page/accounts_drawer.dart';
import 'package:threedpass/features/wallet_screen/presentation/widgets/asset_page/asset_page_appbar.dart';
import 'package:threedpass/features/wallet_screen/presentation/widgets/asset_page/assets_count.dart';
import 'package:threedpass/features/wallet_screen/presentation/widgets/asset_page/recieve_button.dart';
import 'package:threedpass/features/wallet_screen/presentation/widgets/asset_page/transfer_button.dart';
import 'package:threedpass/features/wallet_screen/presentation/widgets/connecting_page/connect_status.dart';

class AssetsPage extends StatelessWidget {
  const AssetsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppServiceLoaderCubit, AppService>(
      builder: (context, state) {
        return Scaffold(
          appBar: AssetPageAppbar(
            account: state.keyring.current,
            context: context,
          ),
          drawer: AccountsDrawer(
            appServiceCubit: BlocProvider.of<AppServiceLoaderCubit>(context),
            accounts: state.keyring.allAccounts,
            current: state.keyring.current,
            context: context,
          ),
          body:
              // SingleChildScrollView(
              //   child:
              Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const AssetsCount(),
              const SizedBox(height: 16),
              // const Padding(
              //   padding: EdgeInsets.symmetric(horizontal: 16),
              //   child: RecieveButton(),
              // ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  SizedBox(width: 16),
                  Flexible(
                    child: TransferButton(),
                  ),
                  SizedBox(width: 8),
                  Flexible(
                    child: RecieveButton(),
                  ),
                  SizedBox(width: 16),
                ],
              ),
            ],
          ),
          // ),
        );
      },
    );
  }
}
