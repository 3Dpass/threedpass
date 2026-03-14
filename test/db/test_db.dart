import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:threedpass/core/polkawallet/constants.dart';
import 'package:threedpass/features/app/data/cache_database.dart';
import 'package:threedpass/features/chains/data/block_time_repository.dart';
import 'package:threedpass/features/chains/domain/entities/chain_type.dart';
import 'package:threedpass/features/chains/domain/entities/hex_ex.dart';
import 'package:threedpass/features/chains/domain/usecases/block_time.dart';
import 'package:threedpass/features/poscan_objects_query/data/poscan_local_repository.dart';
import 'package:threedpass/features/poscan_objects_query/domain/entities/uploaded_object.dart';

Future<void> main() async {
  late CacheDatabase database;
  late PoScanLocalRepository poscanRepoLive;
  late PoScanLocalRepository poscanRepoTest;
  late BlockTimeRepositoryImpl blockTimeRepo;

  // Common test data
  final testHash1 = HexEx(noPrefixValue: "testhhhhash");
  final testHash2 = HexEx(noPrefixValue: "tessssst");
  final testHash3 = HexEx(noPrefixValue: "OtherImpossibleHash");
  const testOwner1 = "owner1";
  const testOwner2 = "owner2";
  const testId1 = 42;
  const testId2 = 110110;
  const testId3 = 12345;
  const testStateName3 = "matters";
  const testContent3Obj = "test content 3";

  // Test data
  final testObj1 = UploadedObject(
    id: testId1,
    stateName: "doesn't matter",
    stateBlock: [],
    compressedWith: "doesn't matter",
    category: {"who": "cares?"},
    whenCreated: 420,
    whenApproved: 421,
    owner: testOwner1,
    propsRaw: [
      PropValueRaw(maxValue: "1", propIdx: "1"),
    ],
    hashes: [testHash1, testHash2],
  );
  final testContent1 = ObjectContent(id: testId1, obj: "test content 1");

  final testObj2 = UploadedObject(
    id: testId2,
    stateName: "doesn't matter",
    stateBlock: [],
    compressedWith: "doesn't matter",
    category: {"who": "cares?"},
    whenCreated: 420,
    whenApproved: 421,
    owner: testOwner2,
    propsRaw: [],
    hashes: [testHash2],
  );
  final testContent2 = ObjectContent(id: testId2, obj: "test content 2");

  final testObj3 = UploadedObject(
    id: testId3,
    stateName: testStateName3,
    stateBlock: [],
    compressedWith: "doesn't matter",
    category: {"who": "cares?"},
    whenCreated: 420,
    whenApproved: 421,
    owner: testOwner1,
    propsRaw: [],
    hashes: [testHash3],
  );
  final testContent3 = ObjectContent(id: testId3, obj: testContent3Obj);

  setUp(() {
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
  });

  tearDown(() async {
    await database.close();
  });

  group('BlockTime Repository Tests', () {
    test('getLatest returns null when database is empty', () async {
      final nullLatest = await blockTimeRepo.getLatest();
      expect(nullLatest, null);
    });

    test('insertReturning successfully inserts and returns block time entry',
        () async {
      final date1Time = DateTime.fromMillisecondsSinceEpoch(1000);
      final date1 = await blockTimeRepo.insertReturning(
        chain: ChainType.native3DPass,
        blockNumber: 228,
        time: date1Time,
      );
      expect(date1?.blockTime, date1Time);
    });

    test('selectWhere finds existing block time entry', () async {
      final date1Time = DateTime.fromMillisecondsSinceEpoch(1000);
      await blockTimeRepo.insertReturning(
        chain: ChainType.native3DPass,
        blockNumber: 228,
        time: date1Time,
      );

      final dateSearch = await blockTimeRepo.selectWhere(
        BlockTimeParams(
          chain: ChainType.native3DPass,
          blockNumber: 228,
        ),
      );
      expect(dateSearch?.blockTime, date1Time);
    });

    test('selectWhere returns null for non-existent block time entry',
        () async {
      final dateSearch = await blockTimeRepo.selectWhere(
        BlockTimeParams(
          chain: ChainType.native3DPass,
          blockNumber: 227,
        ),
      );
      expect(dateSearch, null);
    });

    test('getLatest returns the most recent block time entry', () async {
      final date1Time = DateTime.fromMillisecondsSinceEpoch(1000);
      await blockTimeRepo.insertReturning(
        chain: ChainType.native3DPass,
        blockNumber: 228,
        time: date1Time,
      );

      final date2Time = DateTime.fromMillisecondsSinceEpoch(13000);
      await blockTimeRepo.insertReturning(
        chain: ChainType.native3DPass,
        blockNumber: 420,
        time: date2Time,
      );

      final latest = await blockTimeRepo.getLatest();
      expect(latest?.blockTime, date2Time);
    });
  });

  group('PoScan Repository Tests', () {
    test('countEntries returns 0 for empty repository', () async {
      final count = await poscanRepoLive.countEntries();
      expect(count, 0);
    });

    test('put successfully inserts object and increases count', () async {
      await poscanRepoLive.put(testObj1, testContent1);

      final count = await poscanRepoLive.countEntries();
      expect(count, 1);
    });

    test('repositories with different ss58 formats have isolated data',
        () async {
      await poscanRepoLive.put(testObj1, testContent1);

      final countLive = await poscanRepoLive.countEntries();
      final countTest = await poscanRepoTest.countEntries();

      expect(countLive, 1);
      expect(countTest, 0);
    });

    test('containAnyHash finds objects with matching hash', () async {
      await poscanRepoLive.put(testObj1, testContent1);

      final queryHashes = await poscanRepoLive.containAnyHash([testHash1]);
      final queryHashesId = queryHashes.map((e) => e.id).toList();
      expect(listEquals(queryHashesId, [testId1]), true);
    });

    test('containAnyHash returns empty list for non-existent hash', () async {
      final queryHashes = await poscanRepoLive.containAnyHash(
        [HexEx(noPrefixValue: "hashDoesNotExists")],
      );
      final queryHashesId = queryHashes.map((e) => e.id).toList();
      expect(listEquals(queryHashesId, []), true);
    });

    test('clear removes all entries from repository', () async {
      await poscanRepoLive.put(testObj1, testContent1);

      await poscanRepoLive.clear();
      final count = await poscanRepoLive.countEntries();
      expect(count, 0);
    });

    test('put with duplicate id does not increase count', () async {
      await poscanRepoLive.put(testObj1, testContent1);
      await poscanRepoLive.put(testObj1, testContent1);
      await poscanRepoLive.put(testObj1, testContent1);

      final count = await poscanRepoLive.countEntries();
      expect(count, 1);
    });

    test('containAnyHash finds multiple objects with matching hashes',
        () async {
      await poscanRepoLive.put(testObj1, testContent1);
      await poscanRepoLive.put(testObj2, testContent2);

      final queryHashes =
          await poscanRepoLive.containAnyHash([testHash1, testHash2]);
      final queryHashesId = queryHashes.map((e) => e.id).toList();
      expect(listEquals(queryHashesId, [testId1, testId2]), true);
    });

    test('filterByOwner returns objects owned by specific owner', () async {
      await poscanRepoLive.put(testObj1, testContent1);
      await poscanRepoLive.put(testObj2, testContent2);
      await poscanRepoLive.put(testObj3, testContent3);

      final queryOwner = await poscanRepoLive.filterByOwner(testOwner1);
      final queryOwnerIds = queryOwner.map((e) => e.id).toList();
      expect(listEquals(queryOwnerIds, [testId1, testId3]), true);
    });

    test('getMeta returns correct metadata for stored object', () async {
      await poscanRepoLive.put(testObj3, testContent3);

      final queryObj = await poscanRepoLive.getMeta(testId3);
      expect(queryObj?.stateName, testStateName3);
    });

    test('getData returns correct content for stored object', () async {
      await poscanRepoLive.put(testObj3, testContent3);

      final queryData = await poscanRepoLive.getData(testId3);
      expect(queryData?.obj, testContent3Obj);
    });
  });
}
