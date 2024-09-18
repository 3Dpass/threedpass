import 'package:ferry/ferry.dart';
import 'package:ferry_hive_store/ferry_hive_store.dart';
import 'package:hive_flutter/hive_flutter.dart';

class FerryCache {
  final Cache cache;

  FerryCache(final Box<Map<dynamic, dynamic>> cacheHiveBox)
      : cache = Cache(
          store: HiveStore(cacheHiveBox),
        );
}
