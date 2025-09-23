import 'package:drift/drift.dart';
import 'package:threedpass/features/chains/domain/entities/chain_type.dart';

@TableIndex(
  name: 'block_time_cache_index',
  columns: {#chainIndex, #blockNumber},
)
class BlockTimeCaches extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get chainIndex => intEnum<ChainType>()();
  IntColumn get blockNumber => integer()();
  DateTimeColumn get blockTime => dateTime()();
}
