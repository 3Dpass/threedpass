import 'package:ferry/ferry.dart';
import 'package:ferry_hive_store/ferry_hive_store.dart';
import 'package:gql_http_link/gql_http_link.dart';
import 'package:hive_flutter/adapters.dart';

class FerryClient {
  static const apiUrl = 'https://explorer-api.3dpass.org/graphql/';
  late final Client client;

  FerryClient({required Cache cache}) {
    final link = HttpLink(apiUrl);

    client = Client(
      link: link,
      cache: cache,
    );
  }
}
