import 'letter.dart';
import 'package:equatable/equatable.dart';

class WordToGuess extends Equatable {
  final List<Letter> letters;

  String get toGuess => letters.map((e) => e.valueToGuess).toString();

  const WordToGuess(this.letters);

  factory WordToGuess.empty() {
    return const WordToGuess([]);
  }

  @override
  List<Object?> get props => [letters];
}