import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/features/hashes_list/domain/entities/snapshot.dart';

class SelectSnapshotsState {
  final List<Snapshot> snaps;
  final bool areSelectable;

  const SelectSnapshotsState({
    required this.areSelectable,
    required this.snaps,
  });

  SelectSnapshotsState copyWith({
    final List<Snapshot>? snaps,
    final bool? areSelectable,
  }) {
    return SelectSnapshotsState(
      areSelectable: areSelectable ?? this.areSelectable,
      snaps: snaps ?? this.snaps,
    );
  }

  SelectSnapshotsState.initial()
      : areSelectable = false,
        snaps = [];
}

class SelectSnapshotsCubit extends Cubit<SelectSnapshotsState> {
  SelectSnapshotsCubit() : super(SelectSnapshotsState.initial());

  void toggle(final Snapshot snap) {
    if (state.snaps.contains(snap)) {
      remove(snap);
    } else {
      add(snap);
    }
  }

  void add(final Snapshot snap) {
    final newList = List<Snapshot>.from(state.snaps)..add(snap);
    emit(
      state.copyWith(snaps: newList),
    );
  }

  void remove(final Snapshot snap) {
    final newList = List<Snapshot>.from(state.snaps)..remove(snap);
    emit(
      state.copyWith(snaps: newList),
    );
  }

  void makeSelectable() {
    emit(
      state.copyWith(areSelectable: true),
    );
  }

  void makeUnselectable() {
    emit(
      state.copyWith(areSelectable: false, snaps: []),
    );
  }
}
