import 'package:equatable/equatable.dart';

class Letter extends Equatable {
  final String value;
  final String valueToGuess;

  const Letter(this.value, this.valueToGuess);

  @override
  List<Object?> get props => [value, valueToGuess];
}