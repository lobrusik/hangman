import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_podstawy_utilities/flutter_podstawy_utilities.dart';
import 'package:hangman/models/view_models/game_view_model.dart';
import 'package:provider/provider.dart';

//Defining a StatelessWidget for displaying Hangman images.
class Hangman extends StatelessWidget {
  const Hangman({super.key});

  @override
  Widget build(BuildContext context) {
    return Selector<GameViewModel, int>(
      selector: (context, gameViewModel) => gameViewModel.attempts,
      builder: (context, attempts, child) {
        return Image.asset(getPathToImageAsset("hangman/$attempts.png"));  //Displaying Hangman image based on attempts count.
      },
    );
  }
}