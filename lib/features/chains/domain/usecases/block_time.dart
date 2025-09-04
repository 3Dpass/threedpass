import 'package:threedpass/core/polkawallet/utils/datetime_from_block_number.dart';
import 'package:threedpass/features/app/data/cache_database.dart';
import 'package:threedpass/features/chains/data/block_time_repository.dart';
import 'package:threedpass/features/chains/domain/entities/chain_type.dart';
import 'package:threedpass/core/persistence/basic_get_data_use_case.dart';
import 'package:threedpass/core/usecase.dart';
import 'package:threedpass/features/rest/explorer_rest.dart';

final class BlockTimeParams {
  final int blockNumber;
  final ChainType chain;

  const BlockTimeParams({
    required this.blockNumber,
    required this.chain,
  });
}

sealed class BlockTime {
  final DateTime time;
  final ChainType chain;
  final int blockHeight;

  const BlockTime({
    required this.time,
    required this.blockHeight,
    required this.chain,
  });
}

class ExactTime extends BlockTime {
  const ExactTime({
    required super.time,
    required super.blockHeight,
    required super.chain,
  });
}

class AppoximateTime extends BlockTime {
  const AppoximateTime({
    required super.time,
    required super.blockHeight,
    required super.chain,
  });
}

class GetCachedBlockTime extends BasicGetDataUseCase<BlockTime, BlockTimeParams,
    BlockTimeCache, (DateTime, bool)> {
  final BlockTimeRepository blockTimeRepo;
  final ExplorerRest rest;
  final GetLatestKnownBlockTime getLatestKnownBlockTime;

  GetCachedBlockTime({
    required this.blockTimeRepo,
    required this.rest,
    required this.getLatestKnownBlockTime,
  });

  @override
  Future<BlockTime> fallback(BlockTimeParams params) =>
      getLatestKnownBlockTime(params.chain).then(
        (final latestTime) => AppoximateTime(
          time: latestTime.time.add(
            Duration(
              minutes: (params.blockNumber - latestTime.blockHeight),
            ),
          ),
          blockHeight: params.blockNumber,
          chain: params.chain,
        ),
      );

  @override
  Future<BlockTimeCache?> getCache(BlockTimeParams params) =>
      blockTimeRepo.selectWhere(params);

  @override
  Future<(DateTime, bool)> getRemote(BlockTimeParams params) =>
      rest.getBlock(params.blockNumber).then(
            (final res) => (
              DateTime.fromMillisecondsSinceEpoch(res.time),
              res.isFinalized,
            ),
          );

  @override
  BlockTime mapCacheData(
    BlockTimeCache cacheData,
    BlockTimeParams params,
  ) =>
      ExactTime(
        time: cacheData.blockTime,
        blockHeight: cacheData.blockNumber,
        chain: cacheData.chainIndex,
      );

  @override
  Future<BlockTimeCache?> storeRemote(
    (DateTime, bool) remoteData,
    BlockTimeParams params,
  ) =>
      remoteData.$2
          ? blockTimeRepo.insertReturning(
              chain: params.chain,
              blockNumber: params.blockNumber,
              time: remoteData.$1,
            )
          : Future.value(null);

  @override
  BlockTime mapRemoteData(
    (DateTime, bool) cacheData,
    BlockTimeParams params,
  ) =>
      ExactTime(
          time: cacheData.$1,
          blockHeight: params.blockNumber,
          chain: params.chain);
}

class GetLatestKnownBlockTime extends UseCase<BlockTime, ChainType> {
  GetLatestKnownBlockTime({
    required this.blockTimeRepo,
  });
  final BlockTimeRepository blockTimeRepo;

  @override
  Future<BlockTime> call(ChainType chain) => blockTimeRepo.getLatest().then(
        (final res) => res != null
            ? ExactTime(
                time: res.blockTime,
                blockHeight: res.blockNumber,
                chain: res.chainIndex,
              )
            : chain == ChainType.native3DPass
                ? ExactTime(
                    time: initialBlockDate,
                    blockHeight: 1,
                    chain: ChainType.native3DPass,
                  )
                : throw Exception('Latest block time not found'),
      );
}
