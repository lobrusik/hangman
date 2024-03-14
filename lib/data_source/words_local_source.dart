//An abstract class defining the interface for accessing local word sources.
// Asynchronously retrieves a list of words and returns it wrapped in a Future.
abstract class WordsLocalSource {
  Future<List<String>> getWords();
}