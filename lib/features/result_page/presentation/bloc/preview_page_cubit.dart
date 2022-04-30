import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/features/hashes_list/domain/entities/hash_object.dart';
import 'package:threedpass/features/hashes_list/domain/entities/snapshot.dart';

class PreviewPageCubit extends Cubit<PreviewPageCubitState> {
  PreviewPageCubit(PreviewPageCubitState previewPageLoading)
      : super(previewPageLoading);
}

abstract class PreviewPageCubitState {
  const PreviewPageCubitState();

  HashObject? get hashObject;

  Snapshot get snapshot;
}

class PreviewPageLoading extends PreviewPageCubitState {
  const PreviewPageLoading({
    required this.hashObject,
    required this.snapshot,
  });

  @override
  final HashObject? hashObject;

  @override
  final Snapshot snapshot;
}

class PreviewPageLoaded extends PreviewPageCubitState {
  const PreviewPageLoaded({
    required this.hashObject,
    required this.snapshot,
  });

  @override
  final HashObject? hashObject;

  @override
  final Snapshot snapshot;
}
