import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/features/hashes_list/bloc/hashes_list_bloc.dart';
import 'package:threedpass/features/hashes_list/domain/entities/hash_object.dart';
import 'package:threedpass/features/hashes_list/domain/entities/snapshot.dart';

class PreviewPageCubit extends Cubit<Snapshot> {
  PreviewPageCubit(super.initialState, this.hashesListBloc);

  final HashesListBloc hashesListBloc;

  HashObject get hashObject => hashesListBloc.state.objects.firstWhere(
        (final hashObj) => hashObj.snapshots.contains(
          state,
        ),
      );
}
