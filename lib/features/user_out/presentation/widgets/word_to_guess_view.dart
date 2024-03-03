import 'package:flutter/material.dart';
import 'package:flutter_podstawy_utilities/constants/dimens.dart';
import 'package:flutter_podstawy_utilities/colors/my_colors.dart';
import 'package:hangman/features/user_out/presentation/widgets/hangman_title.dart';
import 'package:hangman/models/letter.dart';
import 'package:hangman/models/word_to_guess.dart';

class WordToGuessView extends StatelessWidget {
  static const double spacing = 6;
  final WordToGuess wordToGuess;

  const WordToGuessView(this.wordToGuess, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          top: Dimens.hugeMargin, bottom: Dimens.normalMargin),
      child: Column(
        children: [
          const HangmanTitle(),
          _buildWord(),
          // Game goal widget
        ],
      ),
    );
  }

  Widget _buildWord() {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: wordToGuess.letters.map(_buildLetter).toList());
  }

  Padding _buildLetter(Letter letter) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: spacing),
      child: Text(
        letter.value.toUpperCase(),
        style: const TextStyle(
            color: MyColors.ufoGreen,
            fontWeight: FontWeight.bold,
            fontSize: 40),
      ),
    );
  }
}