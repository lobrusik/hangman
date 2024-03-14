import 'package:flutter/material.dart';
import 'package:flutter_podstawy_utilities/colors/my_colors.dart';
import 'package:flutter_podstawy_utilities/constants/dimens.dart';
import 'package:hangman/models/viev_models/game_view_model.dart';
import 'package:provider/provider.dart';

//A widget representing a key in the Hangman keyboard.
class HangmanKeyboardKey extends StatelessWidget {
  final String letter;
  final double width;
  final bool isEnabled;

  const HangmanKeyboardKey(
      {required this.letter,
      required this.width,
      required this.isEnabled,
      super.key});

  //Builds the content of the keyboard key.
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: GestureDetector(
          onTap: () {
            Provider.of<GameViewModel>(context, listen: false)
                .letterClicked(letter);
          },
          child: _buildKeyContent()),
    );
  }

  Widget _buildKeyContent() {
    return Container(
      decoration: BoxDecoration(
          color: isEnabled ? MyColors.onahau : MyColors.grey,
          borderRadius: const BorderRadius.all(Radius.circular(5.0))),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: Dimens.normalMargin),
        child: Center(
          child: Text(
            letter.toUpperCase(),
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color:
                    isEnabled ? MyColors.darkCharcoal : MyColors.lightSilver),
          ),
        ),
      ),
    );
  }
}