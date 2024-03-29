import 'package:flutter/material.dart';
import 'package:flutter_podstawy_utilities/colors/my_colors.dart';
import 'package:hangman/di/di.dart';
import 'package:hangman/features/user_out/presentation/widgets/game_result_view.dart';
import 'package:hangman/models/view_models/game_finished_view_model.dart';
import 'package:provider/provider.dart';

//A page displayed when the game is finished.
class GameFinishedPage extends StatelessWidget {
  const GameFinishedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: _buildContent()));
  }

  //Builds the content of the game finished page.
  Widget _buildContent() {
    return ListenableProvider<GameFinishedViewModel>(
        create: (_) => sl<GameFinishedViewModel>(),
        builder: (context, _) => GameResultView(
          screenTitle: "Gratulacje otrzymujesz 1 punkt!",
          actionTitle: "Ja chcę jeszcze raz!",
          backgroundColor: MyColors.ufoGreen,
          action: () {
            //Starts a new game when the action button is pressed
            Provider.of<GameFinishedViewModel>(context, listen: false)
                .startNewGame();
          },
        )
    );
  }
}