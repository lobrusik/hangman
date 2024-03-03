import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_podstawy_utilities/flutter_podstawy_utilities.dart';
import 'package:hangman/models/viev_models/game_view_model.dart';
import 'package:provider/provider.dart';

class Hangman extends StatelessWidget {
  const Hangman({super.key});

  @override
  Widget build(BuildContext context) {
    return Selector<GameViewModel, int>(
      selector: (context, gameViewModel) => gameViewModel.attempts,
      builder: (context, attempts, child) {
        return Image.asset(getPathToImageAsset("hangman/$attempts.png"));
      },
    );
  }
}