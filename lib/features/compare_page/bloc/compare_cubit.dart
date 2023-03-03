import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/features/hashes_list/domain/entities/snapshot.dart';

class CompareCubit extends Cubit<Snapshot> {
  CompareCubit(
    super.initialState, {
    required this.origObj,
    required this.snapshotsToCompare,
    required this.stableHashes,
  });

  final List<Snapshot> snapshotsToCompare;
  final Snapshot origObj;
  final List<String> stableHashes;

  void onChoose(final Snapshot? snapshot) {
    if (snapshot != null) {
      emit(snapshot);
    }
  }
}
