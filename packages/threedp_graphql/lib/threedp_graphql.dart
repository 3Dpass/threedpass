library threedp_graphql;

import 'package:ferry/ferry.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:threedp_graphql/core/init_graphql_client.dart';
import 'package:threedp_graphql/features/transfers_history/data/repositories/transfers_repository.dart';

// Export params
// export 'package:threedp_graphql/features/transfers_history/domain/entities/transfers_request_params.dart';

class ThreedpGraphql {
  static init(GetIt getIt) async {
    final cacheHiveBox =
        await Hive.openBox<Map<String, dynamic>>("graphql_cache_ferry");
    await cacheHiveBox.clear();

    getIt.registerSingleton<Client>(FerryClient(cacheHiveBox).client);

    getIt.registerSingleton<TransfersDatasourceGQL>(
      TransfersDatasourceGQL(client: getIt<Client>()),
    );
  }
}
