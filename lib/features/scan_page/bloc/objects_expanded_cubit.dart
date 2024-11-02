import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/features/hashes_list/domain/entities/hash_object.dart';

class ObjectsExpandedState {
  final Map<HashObject, bool> data;

  const ObjectsExpandedState({
    required this.data,
  });

  ObjectsExpandedState copyWith({
    final Map<HashObject, bool>? data,
  }) {
    return ObjectsExpandedState(
      data: data ?? this.data,
    );
  }

  ObjectsExpandedState.initial() : data = {};

  bool isExpanded(final HashObject obj) {
    return data[obj] ?? false;
  }
}

class ObjectsExpandedCubit extends Cubit<ObjectsExpandedState> {
  ObjectsExpandedCubit() : super(ObjectsExpandedState.initial());

  void set(final HashObject obj, final bool value) {
    final newMap = Map<HashObject, bool>.from(state.data);
    newMap[obj] = value;
    emit(
      state.copyWith(
        data: newMap,
      ),
    );
  }

  void changeKey(final HashObject oldObj, final HashObject newObj) {
    final newMap = Map<HashObject, bool>.from(state.data);
    newMap[newObj] = newMap[oldObj] ?? false;
    newMap.remove(oldObj);
    emit(
      state.copyWith(
        data: newMap,
      ),
    );
  }
}
