import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:polkawallet_sdk/plugin/index.dart';
import 'package:polkawallet_sdk/storage/keyring.dart';
import 'package:threedpass/core/polkawallet/app_service.dart';

class AppServiceCubit extends Cubit<AppService> {
  AppServiceCubit({
    required PolkawalletPlugin polkawalletPlugin,
    required Keyring keyring,
  }) : super(
          AppService(polkawalletPlugin, keyring),
        );
}
