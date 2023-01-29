import 'package:ferry/ferry.dart';
import 'package:ferry_hive_store/ferry_hive_store.dart';
import 'package:gql_http_link/gql_http_link.dart';
import 'package:hive_flutter/adapters.dart';

// Future<Client> initClient() async {
//   await Hive.initFlutter();

//   final box = await Hive.openBox<Map<String, dynamic>>("graphql_cache_ferry");

//   await box.clear();

//   return client;
// }

class FerryClient {
  static const apiUrl = 'https://explorer-api.3dpass.org/graphql/';
  late final Client client;

  FerryClient(final Box<Map<String, dynamic>> cacheHiveBox) {
    final store = HiveStore(cacheHiveBox);

    final cache = Cache(store: store);

    final link = HttpLink(apiUrl);

    client = Client(
      link: link,
      cache: cache,
    );
  }

  // static Future<void> init() async {
  //   client = await initClient();
  // }
}

// class GraphqlClient {
//   // static final GraphqlClient _singleton = GraphqlClient._internal();

//   static Client client;

//   Future<void> init() async {
//     client = await initClient();
//   }
// }
