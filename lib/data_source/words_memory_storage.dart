import 'package:cloud_firestore/cloud_firestore.dart';
import 'words_local_source.dart';

class WordsMemoryStorage implements WordsLocalSource {
  final CollectionReference _wordsCollection =
      FirebaseFirestore.instance.collection('words');

  @override
  Future<List<String>> getWords() async {
    try {
      QuerySnapshot querySnapshot = await _wordsCollection.get();
      List<String> words =
          querySnapshot.docs.map((doc) => doc['word'] as String).toList();
      words.shuffle();
      return words;
    } catch (e) {
            // Obsłuż błąd odpowiednio, np. zaloguj go lub zwróć domyślną listę.
      print('Błąd pobierania słów z Firestore: $e');
      return [];
    }
  }
}
// class WordsMemoryStorage implements WordsLocalSource {
//   final List<String> _words = [
//     "slimak",
//     "kotek"
//   ];

//   WordsMemoryStorage() {
//     _words.shuffle();
//   }

//   @override
//   List<String> getWords() {
//     return _words;
//   }
// }
