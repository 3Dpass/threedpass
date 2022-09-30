import 'package:flutter/material.dart';
import 'package:polkawallet_sdk/plugin/homeNavItem.dart';
import 'package:polkawallet_sdk/api/types/networkParams.dart';
import 'package:polkawallet_sdk/plugin/index.dart';
import 'package:polkawallet_sdk/storage/keyring.dart';

class D3pCorePlugin extends PolkawalletPlugin {
  D3pCorePlugin({
    required int ss58,
    required bool isTestNet,
    required String name,
  }) : basic = PluginBasicData(
          name: name,
          ss58: ss58,
          isTestNet: isTestNet,
        );

  @override
  final PluginBasicData basic;

  @override
  List<HomeNavItem> getNavItems(BuildContext context, Keyring keyring) => [];

  @override
  Map<String, WidgetBuilder> getRoutes(Keyring keyring) => {};

  @override
  Future<String>? loadJSCode() => null;

  @override
  List<NetworkParams> get nodeList => throw UnimplementedError();

  @override
  Map<String, Widget> get tokenIcons => {};
}
