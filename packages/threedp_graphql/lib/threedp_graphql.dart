library threedp_graphql;

import 'package:ferry/ferry.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:super_core/super_core.dart';
import 'package:threedp_graphql/core/ferry_cache.dart';
import 'package:threedp_graphql/core/init_graphql_client.dart';
import 'package:threedp_graphql/features/events/data/repositories/events_datasource_local.dart';
import 'package:threedp_graphql/features/events/data/repositories/events_datasource_remote.dart';
import 'package:threedp_graphql/features/extrinsics/data/repositories/extrinsic_datasource.dart';
import 'package:threedp_graphql/features/transfers_history/data/repositories/transfers_repository.dart';

class ThreedpGraphql extends DIModule {
  @override
  Future<void> setup(GetIt getIt) async {
    final cacheHiveBox =
        await Hive.openBox<Map<dynamic, dynamic>>("graphql_cache_ferry");
    // await cacheHiveBox.clear();

    getIt.registerSingleton<Cache>(FerryCache(cacheHiveBox).cache);

    getIt.registerSingleton<Client>(FerryClient(
      cache: getIt<Cache>(),
    ).client);

    getIt.registerSingleton<TransfersDatasourceGQL>(
      TransfersDatasourceGQL(client: getIt<Client>()),
    );

    getIt.registerSingleton<ExtrinsicDatasourceGQL>(
      ExtrinsicDatasourceGQL(client: getIt<Client>()),
    );

    getIt.registerSingleton<EventsDatasourceGQL>(
      EventsDatasourceGQL(client: getIt<Client>()),
    );
    getIt.registerSingleton<EventsDatasourceLocal>(
      EventsDatasourceLocal(cache: getIt<Cache>()),
    );
  }
}
