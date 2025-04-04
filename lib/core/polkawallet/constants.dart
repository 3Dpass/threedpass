import 'package:polkawallet_sdk/api/apiKeyring.dart';

const int ss58formatTest = 72;
const int ss58formatLive = 71;

const String d3pLiveName = '3DP live';
const String d3pTestName = '3DP test';

const deprecatedD3pDefaultNodeUrls = [
  'wss://rpc.3dpscan.io',
];
const d3pDefaultNodeUrl = 'wss://rpc.3dpass.org';
const defaultCryptoType = CryptoType.sr25519;
