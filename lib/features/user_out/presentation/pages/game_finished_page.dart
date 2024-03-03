import 'package:flutter/material.dart';
import 'package:flutter_podstawy_utilities/colors/my_colors.dart';
import 'package:hangman/di/di.dart';
import 'package:hangman/features/user_out/presentation/widgets/game_result_view.dart';
import 'package:hangman/models/viev_models/game_finished_view_model.dart';
import 'package:provider/provider.dart';

class GameFinishedPage extends StatelessWidget {
  const GameFinishedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: _buildContent()));
  }

  Widget _buildContent() {
    return ListenableProvider<GameFinishedViewModel>(
        create: (_) => sl<GameFinishedViewModel>(),
        builder: (context, _) => GameResultView(
              screenTitle: "Gratulacje otrzymujesz 1 punkt!",
              actionTitle: "Ja chcę jeszcze raz!",
              backgroundColor: MyColors.ufoGreen,
              action: () {
                Provider.of<GameFinishedViewModel>(context, listen: false)
                    .startNewGame();
              },
            ));
  }
}