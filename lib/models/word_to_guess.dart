import 'letter.dart';
import 'package:equatable/equatable.dart';

//Represent a word to be guessed in the Hangman game.
class WordToGuess extends Equatable {
  final List<Letter> letters; //A list of Letter objects representing the letters in the word.

  //Return a string representation of the word to guess. 
  //It maps each letter in the letters list to its valueToGuess property and converts it to a string.
  String get toGuess => letters.map((e) => e.valueToGuess).toString(); 
  
  const WordToGuess(this.letters);

  factory WordToGuess.empty() {
    return const WordToGuess([]);
  }

  @override
  List<Object?> get props => [letters];
}