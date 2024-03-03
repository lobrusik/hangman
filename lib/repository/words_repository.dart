import 'package:hangman/data_source/words_local_source.dart';

class WordsRepository {
  final WordsLocalSource wordsLocalSource;

  WordsRepository(this.wordsLocalSource);

  Future<String> getWord(int index) async {
    final words = await wordsLocalSource.getWords();

    if (index >= words.length) {
      return "";
    }
    return words[index];
  }

  Future<int> getWordsCount() async {
    final words = await wordsLocalSource.getWords();
    return words.length;
  }
}