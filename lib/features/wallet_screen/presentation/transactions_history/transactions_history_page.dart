import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';

class TransactionsHistoryPage extends StatelessWidget {
  @override
  Widget build(final BuildContext context) {
    final appService = BlocProvider.of<AppServiceLoaderCubit>(context).state;
    final keyring = appService.keyring;
    final pubKey = keyring.current.pubKey;
    final pageKey = 1;
    final readRepositories = """
query{
  getTransfers(pageKey: "$pageKey", pageSize: 2, filters: 
    {
      toMultiAddressAccountId: "0xf9708e1db9f578d213c17e3baab72cdf750d3f88ad6a756799b9e9fd13bc22b4"
    }
  ){
    pageInfo{
      pageSize,
      pageNext,
      pagePrev
    }
    objects{
      blockNumber,
      extrinsicIdx,
      eventIdx,
      fromMultiAddressAccountId,
      toMultiAddressAccountId,
      value
    }
  }
}
""";
// 'query{getTransfers(pageKey: "${pageKey}", pageSize: 12, ) {pageInfo{pageSize, pageNext, pagePrev}, objects{blockNumber, eventIdx, extrinsicIdx, value, blockDatetime, complete, fromMultiAddressType, fromMultiAddressAccountId, toMultiAddressType, toMultiAddressAccountId}}}';

    FetchMoreOptions opts = FetchMoreOptions(
      variables: {'cursor': ''},
      updateQuery: (previousResultData, fetchMoreResultData) {
        // this function will be called so as to combine both the original and fetchMore results
        // it allows you to combine them as you would like
        final List<dynamic> repos = [
          // ...previousResultData['search']['nodes'] as List<dynamic>,
          // ...fetchMoreResultData['search']['nodes'] as List<dynamic>
        ];

        // to avoid a lot of work, lets just update the list of repos in returned
        // data with new data, this also ensures we have the endCursor already set
        // correctly
        fetchMoreResultData['search']['nodes'] = repos;

        return fetchMoreResultData;
      },
    );
    return Scaffold(
      appBar: AppBar(
        title: Text('Transactions History'),
      ),
      body: Center(
        child: Query(
          options: QueryOptions(
            document: gql(
              readRepositories,
            ), // this is the query string you just created
            // variables: {
            //   'nRepositories': 50,
            // },
            // pollInterval: const Duration(seconds: 10),
            fetchPolicy: FetchPolicy.cacheFirst,
          ),

          // Just like in apollo refetch() could be used to manually trigger a refetch
          // while fetchMore() can be used for pagination purpose
          builder: (
            final QueryResult result, {
            final VoidCallback? refetch,
            final FetchMore? fetchMore,
          }) {
            if (result.hasException) {
              return Text(result.exception.toString());
            }

            if (result.isLoading) {
              return const Text('Loading');
            }

            return Text(result.data.toString());
          },
        ),
      ),
    );
  }
}

// class 
