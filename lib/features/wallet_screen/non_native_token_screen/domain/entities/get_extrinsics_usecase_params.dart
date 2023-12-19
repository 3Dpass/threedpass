import 'package:polkawallet_sdk/plugin/store/balances.dart';

class GetExtrinsicsUseCaseParams {
  final String address;
  final TokenBalanceData tokenBalanceData;

  const GetExtrinsicsUseCaseParams({
    required this.address,
    required this.tokenBalanceData,
  });
}
