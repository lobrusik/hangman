import 'package:flutter/material.dart';
import 'package:hangman/features/user_out/presentation/widgets/game_result_view.dart';
import 'package:hangman/models/viev_models/game_view_model.dart';
import 'package:provider/provider.dart';

class GameFailedState extends StatelessWidget {
  const GameFailedState({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GameResultView(
        action:
            Provider.of<GameViewModel>(context, listen: false).prepareNewGame,
        screenTitle: "Wisisz",
        actionTitle: "Kolejna próba plz",
        backgroundColor: Color.fromARGB(255, 251, 219, 220));
  }
}