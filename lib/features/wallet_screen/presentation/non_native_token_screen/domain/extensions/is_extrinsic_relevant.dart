import 'package:threedp_graphql/features/tokens_events_history/data/query/__generated__/get_tokens_events.data.gql.dart';

extension IsExtrinsicRelevant on GGetExtrinsicsData_getExtrinsics_objects {
  bool isRelevant(final String accountID) {
    final isExtrinsicAuthor =
        multiAddressAccountId?.contains(accountID) ?? false;
    final isContainsInParams =
        callArguments?.value.contains(accountID) ?? false;

    return isExtrinsicAuthor || isContainsInParams;
  }
}
