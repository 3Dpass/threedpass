import 'package:polkawallet_sdk/api/types/networkParams.dart';

const int ss58formatTest = 72;
const int ss58formatLive = 71;

const d3pLiveNetNode = {
  'name': '3DP main',
  'ss58': ss58formatLive,
  'endpoint': 'wss://rpc2.3dpass.org',
};

final d3pLiveNodesList = [
  NetworkParams.fromJson(d3pLiveNetNode),
];
