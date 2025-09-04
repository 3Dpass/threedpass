import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:threedpass/core/polkawallet/constants.dart';
import 'package:threedpass/features/app/data/cache_database.dart';
import 'package:threedpass/features/chains/data/block_time_repository.dart';
import 'package:threedpass/features/chains/domain/entities/chain_type.dart';
import 'package:threedpass/features/chains/domain/usecases/block_time.dart';
import 'package:threedpass/features/poscan_objects_query/data/poscan_local_repository.dart';
import 'package:threedpass/features/poscan_objects_query/domain/entities/uploaded_object.dart';

Future<void> main() async {
  late CacheDatabase database;
  late PoScanLocalRepository poscanRepoLive;
  late PoScanLocalRepository poscanRepoTest;
  late BlockTimeRepositoryImpl blockTimeRepo;

  database = CacheDatabase(DatabaseConnection(
    NativeDatabase.memory(),
    closeStreamsSynchronously: true,
  ));

  poscanRepoLive = PoScanLocalRepositoryImpl(
    db: database,
    ss58: ss58formatLive,
  );
  poscanRepoTest = PoScanLocalRepositoryImpl(
    db: database,
    ss58: ss58formatTest,
  );
  blockTimeRepo = BlockTimeRepositoryImpl(database);

  group('DB tests', () {
    test('blockTime', () async {
      final nullLatest = await blockTimeRepo.getLatest();
      expect(nullLatest, null);

      final date1Time = DateTime.fromMillisecondsSinceEpoch(1337);
      final date1 = await blockTimeRepo.insertReturning(
        chain: ChainType.native3DPass,
        blockNumber: 228,
        time: date1Time,
      );
      expect(date1?.blockTime, date1Time);

      final dateSearch = await blockTimeRepo.selectWhere(
        BlockTimeParams(
          chain: ChainType.native3DPass,
          blockNumber: 228,
        ),
      );
      expect(dateSearch?.blockTime, date1Time);

      final dateSearch2 = await blockTimeRepo.selectWhere(
        BlockTimeParams(
          chain: ChainType.native3DPass,
          blockNumber: 227,
        ),
      );
      expect(dateSearch2, null);

      final date2Time = DateTime.fromMillisecondsSinceEpoch(13377);
      final date2 = await blockTimeRepo.insertReturning(
        chain: ChainType.native3DPass,
        blockNumber: 420,
        time: date2Time,
      );
      expect(date2?.blockTime, date2Time);

      final latest2 = await blockTimeRepo.getLatest();
      expect(latest2?.blockTime, date2Time);
    });

    test('poscan', () async {
      final count1 = await poscanRepoLive.countEntries();
      expect(count1, 0);

      final testHash1 = "testhhhhash";
      final testHash2 = "tessssst";
      final testOwner1 = "owner1";
      final testId1 = 42;

      final testObj1 = UploadedObject(
        id: testId1,
        stateName: "doesn't matter",
        stateBlock: [],
        obj: Uint8List(0),
        compressedWith: "doesn't matter",
        category: {"who": "cares?"},
        whenCreated: 420,
        whenApproved: 421,
        owner: testOwner1,
        propsRaw: [],
        hashes: [testHash1, testHash2],
      );
      await poscanRepoLive.put(testObj1);

      final count2 = await poscanRepoLive.countEntries();
      expect(count2, 1);

      final count3 = await poscanRepoTest.countEntries();
      expect(count3, 0);

      final queryHashes1 = await poscanRepoLive.containAnyHash([testHash1]);
      expect(listEquals(queryHashes1, [testId1]), true);

      final queryHashes2 =
          await poscanRepoLive.containAnyHash(["hashDoesNotExists"]);
      expect(listEquals(queryHashes2, []), true);

      await poscanRepoLive.clear();
      final count4 = await poscanRepoLive.countEntries();
      expect(count4, 0);

      final testId2 = 110110;
      final testObj2 = UploadedObject(
        id: testId2,
        stateName: "doesn't matter",
        stateBlock: [],
        obj: Uint8List(0),
        compressedWith: "doesn't matter",
        category: {"who": "cares?"},
        whenCreated: 420,
        whenApproved: 421,
        owner: "owner2",
        propsRaw: [],
        hashes: [testHash2],
      );
      final testId3 = 12345;
      final testStateName3 = "matters";
      final testObj3 = UploadedObject(
        id: testId3,
        stateName: testStateName3,
        stateBlock: [],
        obj: Uint8List(0),
        compressedWith: "doesn't matter",
        category: {"who": "cares?"},
        whenCreated: 420,
        whenApproved: 421,
        owner: testOwner1,
        propsRaw: [],
        hashes: ['OtherImpossibleHash'],
      );

      await poscanRepoLive.put(testObj1);
      await poscanRepoLive.put(testObj2);
      await poscanRepoLive.put(testObj3);

      final count5 = await poscanRepoLive.countEntries();
      expect(count5, 3);

      final queryHashes3 =
          await poscanRepoLive.containAnyHash([testHash1, testHash2]);
      expect(listEquals(queryHashes3, [testId1, testId2]), true);

      final queryOwner = await poscanRepoLive.filterByOwner(testOwner1);
      expect(listEquals(queryOwner, [testId1, testId3]), true);

      final queryObj = await poscanRepoLive.get(testId3);
      expect(queryObj?.stateName, testStateName3);
    });
  });

  await database.close();
}
