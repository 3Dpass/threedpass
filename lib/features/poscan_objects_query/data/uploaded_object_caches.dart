import 'package:drift/drift.dart';

@TableIndex(
  name: 'uploaded_object_hash_index',
  columns: {#joinedHashes},
)
class UploadedObjectCaches extends Table {
  IntColumn get id => integer()();
  IntColumn get ss58 => integer()();
  TextColumn get stateName => text()();
  TextColumn get stateBlockJson => text()();
  TextColumn get compressedWith => text()();
  TextColumn get categoryJson => text()();
  IntColumn get whenCreated => integer()();
  IntColumn get whenApproved => integer().nullable()();
  TextColumn get owner => text()();
  TextColumn get propsJson => text()();
  TextColumn get joinedHashes => text()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

class UploadedObjectContents extends Table {
  IntColumn get id => integer()();
  IntColumn get ss58 => integer()();
  BlobColumn get obj => blob()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}
