import 'package:flutter/material.dart';
import 'package:hangman/features/user_out/presentation/widgets/game_result_view.dart';
import 'package:hangman/models/viev_models/game_view_model.dart';
import 'package:provider/provider.dart';

class GameFinishedState extends StatelessWidget {
  const GameFinishedState({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GameResultView(
        action:
            Provider.of<GameViewModel>(context, listen: false).prepareNextLevel,
        screenTitle: "Poziom ukończony",
        actionTitle: "Nowy poziom",
        backgroundColor: const Color.fromARGB(255, 201, 241, 219));
  }
}