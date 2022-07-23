import 'package:flutter_bloc/flutter_bloc.dart';

class MnemonicInputState {
  final List<String> words;
  final String result;

  const MnemonicInputState({
    required this.result,
    required this.words,
  });
}

class MnemonicInputCubit extends Cubit<MnemonicInputState> {
  MnemonicInputCubit(String mnemonic)
      : _initial = mnemonic,
        super(
          MnemonicInputState(
            result: '',
            words: genWords(mnemonic),
          ),
        );

  final String _initial;

  void onWordPressed(String word) {
    final current = state;
    final newList = List<String>.from(current.words);
    newList.removeWhere((element) => element == word);

    final newResult = current.result.isEmpty ? word : state.result + ' ' + word;

    emit(MnemonicInputState(result: newResult, words: newList));
  }

  void reset() {
    emit(
      MnemonicInputState(
        result: '',
        words: genWords(_initial),
      ),
    );
  }

  static List<String> genWords(String mnemonic) {
    return mnemonic.split(' ')..shuffle();
  }
}
