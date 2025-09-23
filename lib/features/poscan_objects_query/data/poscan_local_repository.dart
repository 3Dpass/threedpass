import 'dart:async';
import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:threedpass/core/utils/logger.dart';
import 'package:threedpass/features/app/data/cache_database.dart';
import 'package:threedpass/features/chains/domain/entities/hex_ex.dart';
import 'package:threedpass/features/poscan_objects_query/domain/entities/uploaded_object.dart';

abstract class PoScanLocalRepository {
  const PoScanLocalRepository({required this.ss58});

  final int ss58;

  Future<void> clear();

  Future<int> countEntries();

  Future<void> put(final UploadedObject object, final ObjectContent content);

  Future<UploadedObject?> getMeta(final int id);
  Future<ObjectContent?> getData(final int id);

  Future<List<UploadedObject>> filterByOwner(final String address);

  Future<List<UploadedObject>> containAnyHash(
    final List<HexEx> hashes,
  );
}

typedef _Filter = Expression<bool> Function($UploadedObjectCachesTable);

class PoScanLocalRepositoryImpl extends PoScanLocalRepository {
  final CacheDatabase db;

  const PoScanLocalRepositoryImpl({
    required this.db,
    required super.ss58,
  });

  Expression<bool> get filterBySS58 =>
      db.uploadedObjectCaches.ss58.equals(ss58);

  GeneratedColumn<int> get idCol => db.uploadedObjectCaches.id;
  GeneratedColumn<int> get ss58Col => db.uploadedObjectCaches.ss58;

  _Filter exprTemplate(final _Filter other) => (final tbl) => Expression.and(
        [
          filterBySS58,
          other(tbl),
        ],
      );

  @override
  Future<void> clear() => Future.wait([
        db.delete(db.uploadedObjectCaches).go(),
        db.delete(db.uploadedObjectContents).go(),
      ]);

  Future<List<UploadedObject>> filterObjects(
    final _Filter cond,
  ) async {
    final queryObjects = db.select(db.uploadedObjectCaches)
      ..where(exprTemplate(cond));

    final res = await queryObjects.get();
    return res.map((e) => UploadedObject.fromCache(e)).toList();
  }

  @override
  Future<int> countEntries() async {
    final countExp = db.uploadedObjectCaches.id.count();
    final query = db.selectOnly(db.uploadedObjectCaches)
      ..addColumns([idCol, ss58Col])
      ..where(filterBySS58)
      ..addColumns([countExp]);

    final result = await query.getSingle();
    final res = result.read(countExp) ?? 0;
    logger.t("Found $res entries in objects cache");
    return res;
  }

  @override
  Future<List<UploadedObject>> filterByOwner(String address) => filterObjects(
        (final tbl) => tbl.owner.equals(address),
      );

  @override
  Future<List<UploadedObject>> containAnyHash(List<HexEx> hashes) {
    final filter = (final $UploadedObjectCachesTable tbl) => Expression.or(
          hashes.map(
            (e) =>
                db.uploadedObjectCaches.joinedHashes.contains(e.noPrefixValue),
          ),
        );
    return filterObjects(filter);
  }

  @override
  Future<UploadedObject?> getMeta(int id) async {
    final query = await filterObjects(
      (final $UploadedObjectCachesTable tbl) => tbl.id.equals(id),
    );
    if (query.isNotEmpty) {
      logger.t("Found meta for $id in objects cache");
      return query.first;
    } else {
      return null;
    }
  }

  @override
  Future<void> put(
    final UploadedObject object,
    final ObjectContent content,
  ) async {
    logger.t(
      "Put full object info for contentId=${content.id} objectId=${object.id}",
    );
    await db.into(db.uploadedObjectCaches).insert(
          UploadedObjectCachesCompanion.insert(
            id: Value(object.id),
            ss58: ss58,
            stateName: object.stateName,
            stateBlockJson: jsonEncode(object.stateBlock),
            compressedWith: object.compressedWith,
            categoryJson: jsonEncode(object.category),
            whenCreated: object.whenCreated,
            whenApproved: Value(object.whenApproved),
            owner: object.owner,
            propsJson: jsonEncode(object.propsRaw),
            joinedHashes:
                object.hashes.map((final e) => e.noPrefixValue).join('\n'),
          ),
          mode: InsertMode.insertOrReplace,
        );
    await db.into(db.uploadedObjectContents).insert(
          UploadedObjectContentsCompanion.insert(
            id: Value(content.id),
            ss58: ss58,
            obj: Uint8List.fromList(content.obj.codeUnits),
          ),
          mode: InsertMode.insertOrReplace,
        );
  }

  @override
  Future<ObjectContent?> getData(int id) async {
    final queryObjects = db.select(db.uploadedObjectContents)
      ..where(
        (final uot) => Expression.and(
          [
            uot.id.equals(id),
            uot.ss58.equals(ss58),
          ],
        ),
      );

    final res = await queryObjects.getSingleOrNull();
    // logger.d(
    //     '[DEBUG] Found ${res.length} results for getData for id $id ${res.map((e) => e.obj.sublist(0, 5)).toList().join(', ')}');
    if (res != null) {
      logger.t("Found obj data for $id in objects cache");
      return ObjectContent(
        id: res.id,
        obj: String.fromCharCodes(res.obj),
      );
    } else {
      return null;
    }
  }
}
