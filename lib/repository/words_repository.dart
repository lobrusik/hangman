import 'package:hangman/data_source/words_local_source.dart';

//Represent the repository responsible for handling word-related data operations.
class WordsRepository {
  final WordsLocalSource wordsLocalSource;

  WordsRepository(this.wordsLocalSource);

  //This method retrieves a word at a specified index from the local data source. 
  //It first retrieves all words using wordsLocalSource.getWords(), then checks if the index is within bounds. 
  //If so, it returns the word at the specified index; otherwise, it returns an empty string.
  Future<String> getWord(int index) async {
    final words = await wordsLocalSource.getWords();

    if (index >= words.length) {
      return "";
    }
    return words[index];
  }

  //This method retrieves the total count of words available in the local data source. 
  //It fetches all words using wordsLocalSource.getWords() and returns the length of the list.
  Future<int> getWordsCount() async {
    final words = await wordsLocalSource.getWords();
    return words.length;
  }
}