import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/features/hashes_list/domain/entities/hash_object.dart';
import 'package:threedpass/features/hashes_list/domain/entities/snapshot.dart';

class PreviewPageCubit extends Cubit<PreviewPageCubitState> {
  PreviewPageCubit(final PreviewPageCubitState previewPageLoading)
      : super(previewPageLoading);
}

abstract class PreviewPageCubitState {
  const PreviewPageCubitState({
    required this.snapshot,
  });

  HashObject? get hashObject;
  PreviewSnapshotType get psType;

  final Snapshot snapshot;
}

class PreviewNewObject extends PreviewPageCubitState {
  const PreviewNewObject({
    required final Snapshot snapshot,
  }) : super(snapshot: snapshot);

  @override
  HashObject? get hashObject => null;

  @override
  PreviewSnapshotType get psType => PreviewSnapshotType.newObject;
}

class PreviewNewSnapshot extends PreviewPageCubitState {
  const PreviewNewSnapshot({
    required this.hashObject,
    required final Snapshot snapshot,
  }) : super(snapshot: snapshot);

  @override
  final HashObject hashObject;

  @override
  PreviewSnapshotType get psType => PreviewSnapshotType.newSnapshot;
}

class PreviewExistingSnapshot extends PreviewPageCubitState {
  const PreviewExistingSnapshot({
    required this.hashObject,
    required final Snapshot snapshot,
  }) : super(snapshot: snapshot);

  @override
  final HashObject hashObject;

  @override
  PreviewSnapshotType get psType => PreviewSnapshotType.existingSnapshot;
}

enum PreviewSnapshotType { newObject, newSnapshot, existingSnapshot }
