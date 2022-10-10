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

  final Snapshot snapshot;
}

class PreviewNewObject extends PreviewPageCubitState {
  const PreviewNewObject({
    required final Snapshot snapshot,
  }) : super(snapshot: snapshot);

  @override
  HashObject? get hashObject => null;
}

class PreviewNewSnapshot extends PreviewPageCubitState {
  const PreviewNewSnapshot({
    required this.hashObject,
    required final Snapshot snapshot,
  }) : super(snapshot: snapshot);

  @override
  final HashObject hashObject;
}

class PreviewExistingSnapshot extends PreviewPageCubitState {
  const PreviewExistingSnapshot({
    required this.hashObject,
    required final Snapshot snapshot,
  }) : super(snapshot: snapshot);

  @override
  final HashObject hashObject;
}
