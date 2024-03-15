import 'package:flutter/material.dart';
import 'package:hangman/features/user_out/presentation/widgets/game_result_view.dart';
import 'package:hangman/models/view_models/game_view_model.dart';
import 'package:provider/provider.dart';

//A class representing the state of the game when the user fails.
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