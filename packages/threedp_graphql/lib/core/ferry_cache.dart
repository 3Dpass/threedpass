import 'package:ferry/ferry.dart';
import 'package:ferry_hive_store/ferry_hive_store.dart';
import 'package:hive_flutter/hive_flutter.dart';

class FerryCache {
  final Cache cache;

  FerryCache(Box<Map<String, dynamic>> cacheHiveBox)
      : cache = Cache(
          store: HiveStore(cacheHiveBox),
        );
}
