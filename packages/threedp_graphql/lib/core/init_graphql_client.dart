import 'package:ferry/ferry.dart';
import 'package:gql_http_link/gql_http_link.dart';

class FerryClient {
  static const apiUrl = 'https://explorer-api.3dpscan.io/graphql/';
  late final Client client;

  FerryClient({required Cache cache}) {
    final link = HttpLink(apiUrl);

    client = Client(
      link: link,
      cache: cache,
    );
  }
}
