import 'package:flutter/material.dart';
import 'package:hangman/features/user_out/presentation/widgets/hangman.dart';
import 'package:hangman/features/user_out/presentation/widgets/keyboard/hangman_keyboard.dart';
import 'package:hangman/features/user_out/presentation/widgets/word_to_guess_view.dart';
import 'package:hangman/models/viev_models/game_view_model.dart';
import 'package:hangman/models/word_to_guess.dart';
import 'package:provider/provider.dart';

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
              child: WordToGuessView(wordToGuess),
            ),
            const Expanded(child: Hangman()),
            const HangmanKeyboard()
          ],
        );
      },
    );
  }
}