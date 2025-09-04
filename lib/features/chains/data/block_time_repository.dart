import 'package:drift/drift.dart';
import 'package:threedpass/features/app/data/cache_database.dart';
import 'package:threedpass/features/chains/domain/entities/chain_type.dart';
import 'package:threedpass/features/chains/domain/usecases/block_time.dart';

abstract class BlockTimeRepository {
  Future<BlockTimeCache?> getLatest();
  Future<BlockTimeCache?> insertReturning({
    required final ChainType chain,
    required final int blockNumber,
    required final DateTime time,
  });
  Future<BlockTimeCache?> selectWhere(final BlockTimeParams params);
}

class BlockTimeRepositoryImpl extends BlockTimeRepository {
  final CacheDatabase cacheDB;

  BlockTimeRepositoryImpl(this.cacheDB);

  @override
  Future<BlockTimeCache?> getLatest() =>
      (cacheDB.select(cacheDB.blockTimeCaches)
            ..orderBy([(u) => OrderingTerm.desc(u.id)])
            ..limit(1))
          .getSingleOrNull();

  @override
  Future<BlockTimeCache?> selectWhere(BlockTimeParams params) =>
      (cacheDB.select(cacheDB.blockTimeCaches)
            ..where(
              (final tbl) => Expression.and(
                [
                  tbl.chainIndex.equals(params.chain.index),
                  tbl.blockNumber.equals(params.blockNumber),
                ],
              ),
            ))
          .getSingleOrNull();

  @override
  Future<BlockTimeCache?> insertReturning({
    required ChainType chain,
    required int blockNumber,
    required DateTime time,
  }) =>
      cacheDB.into(cacheDB.blockTimeCaches).insertReturningOrNull(
            BlockTimeCachesCompanion.insert(
              chainIndex: chain,
              blockNumber: blockNumber,
              blockTime: time,
            ),
          );
}
