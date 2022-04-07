import 'package:bloc/bloc.dart';
import 'package:threedpass/store.dart';

part 'hashes_list_event.dart';
part 'hashes_list_state.dart';

class HashesListBloc extends Bloc<HashesListEvent, HashesListState> {
  HashesListBloc() : super(HashesListInitial()) {
    on<HashesListEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
