import 'package:equatable/equatable.dart';

//Represent a letter in the Hangman game.
class Letter extends Equatable {
  final String value; //Represents the actual value of the letter.
  final String valueToGuess; //Represents the value of the letter to be guessed in the Hangman game

  const Letter(this.value, this.valueToGuess);

  @override
  List<Object?> get props => [value, valueToGuess];
}