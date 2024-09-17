import 'package:threedpass/features/graphql/extrinsics/data/query/__generated__/get_extrnsics.data.gql.dart';

extension IsExtrinsicRelevant on GGetExtrinsicsData_getExtrinsics_objects {
  bool isRelevant(final String accountID) {
    final isExtrinsicAuthor =
        multiAddressAccountId?.contains(accountID) ?? false;
    final isContainsInParams =
        callArguments?.value.contains(accountID) ?? false;

    return isExtrinsicAuthor || isContainsInParams;
  }
}
