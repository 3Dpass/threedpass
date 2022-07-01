import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/features/hashes_list/domain/entities/hash_object.dart';
import 'package:threedpass/features/hashes_list/domain/entities/snapshot.dart';

class PreviewPageCubit extends Cubit<PreviewPageCubitState> {
  PreviewPageCubit(PreviewPageCubitState previewPageLoading)
      : super(previewPageLoading);
}

class PreviewPageCubitState {
  const PreviewPageCubitState({
    required this.hashObject,
    required this.snapshot,
  });

  final HashObject? hashObject;

  final Snapshot snapshot;
}

class PreviewExistingSnapshot extends PreviewPageCubitState {
  const PreviewExistingSnapshot({
    required HashObject hashObject,
    required Snapshot snapshot,
  }) : super(hashObject: hashObject, snapshot: snapshot);
}
