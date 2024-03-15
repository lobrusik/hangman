import 'package:flutter/material.dart';
import 'package:hangman/features/user_out/presentation/widgets/hangman.dart';
import 'package:hangman/features/user_out/presentation/widgets/keyboard/hangman_keyboard.dart';
import 'package:hangman/features/user_out/presentation/widgets/word_to_guess_view.dart';
import 'package:hangman/models/view_models/game_view_model.dart';
import 'package:hangman/models/word_to_guess.dart';
import 'package:provider/provider.dart';

// A class representing the state of the game when it's started.
class GameStartedState extends StatelessWidget {
  const GameStartedState({super.key});

  @override
  Widget build(BuildContext context) {
    return Selector<GameViewModel, WordToGuess>(
      selector: (context, provider) => provider.wordToGuess,
      builder: (context, wordToGuess, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: WordToGuessView(wordToGuess), //Displaying the word to guess.
            ),
            const Expanded(child: Hangman()), //Displaying the hangman widget.
            const HangmanKeyboard() // Displaying the hangman keyboard widget.
          ],
        );
      },
    );
  }
}