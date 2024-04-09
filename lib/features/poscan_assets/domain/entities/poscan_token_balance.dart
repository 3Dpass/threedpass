import 'package:threedpass/features/poscan_assets/domain/entities/poscan_token_data.dart';

class PoscanTokenBalance {
  final double balance;
  final PoscanTokenData tokenData;

  const PoscanTokenBalance({
    required this.balance,
    required this.tokenData,
  });
}
