import 'package:cloud_firestore/cloud_firestore.dart';
import 'words_local_source.dart';

//Firestrore - backend
class WordsMemoryStorage implements WordsLocalSource {
  final CollectionReference _wordsCollection =
      FirebaseFirestore.instance.collection('words'); 

    // /Retrieves and returns a list of words downloaded from Firestore, if an error occurs it returns an empty list

  @override
  Future<List<String>> getWords() async {
    try {
      //Fetch documents
      QuerySnapshot querySnapshot = await _wordsCollection.get();
      //Extract the 'word' field from each document and store it in a list.
      List<String> words =
          querySnapshot.docs.map((doc) => doc['word'] as String).toList();
      words.shuffle(); //Shuffle the list
      return words;
    } catch (e) {
            //Handle the error appropriately, such as logging it or returning a default list.
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
