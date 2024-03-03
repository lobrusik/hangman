import 'package:flutter/material.dart';
import 'package:flutter_podstawy_utilities/constants/dimens.dart';
import 'package:flutter_podstawy_utilities/wisielec/wisielec_constans.dart';
import 'package:hangman/features/user_out/presentation/widgets/keyboard/hangman_keyboard_key.dart';
import 'package:hangman/models/viev_models/game_view_model.dart';
import 'package:provider/provider.dart';

class HangmanKeyboard extends StatelessWidget {
  static const double spacing = 6;

  const HangmanKeyboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          top: Dimens.bigMargin, bottom: Dimens.hugeMargin),
      child: Column(
        children: keyboardLetters.map((String keysRow) {
          var lettersInRow = keysRow.split('');
          return _buildKeyboardRow(lettersInRow, context);
        }).toList(),
      ),
    );
  }

  Widget _buildKeyboardRow(List<String> letters, BuildContext context) {
    final itemWidth = _calculateItemWidth(context);

    return Padding(
      padding: const EdgeInsets.only(top: Dimens.normalMargin),
      child: Selector<GameViewModel, List<String>>(
        selector: (_, gameViewModel) => gameViewModel.attemptedLetters,
        builder: (_, attemptedLetters, __) {
          return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: letters
                  .map((letter) => _buildKeyboardKey(
                      letter, itemWidth, !attemptedLetters.contains(letter)))
                  .toList());
        },
      ),
    );
  }

  Widget _buildKeyboardKey(String letter, double itemWidth, bool isEnabled) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: spacing / 2),
        child: HangmanKeyboardKey(
          letter: letter,
          width: itemWidth,
          isEnabled: isEnabled,
        ));
  }

  double _calculateItemWidth(BuildContext context) {
    final maxLettersInRow = keyboardLetters.first.length;
    final spacingSumWidth = spacing * maxLettersInRow;
    final availableWidth = MediaQuery.of(context).size.width - spacingSumWidth;

    return availableWidth / maxLettersInRow;
  }
}