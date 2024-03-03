import 'package:flutter/material.dart';
import 'package:flutter_podstawy_utilities/colors/my_colors.dart';
import 'package:hangman/di/di.dart';
import 'package:hangman/enums/game_state.dart';
import 'package:hangman/features/user_out/presentation/widgets/states/game_failed_state.dart';
import 'package:hangman/features/user_out/presentation/widgets/states/game_finished_state.dart';
import 'package:hangman/features/user_out/presentation/widgets/states/game_started_state.dart';
import 'package:hangman/models/viev_models/game_view_model.dart';
import 'package:provider/provider.dart';
class HangmanPage extends StatelessWidget {
  const HangmanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: _buildContent(context)));
  }

  Widget _buildContent(BuildContext context) {
    return ListenableProvider<GameViewModel>(
        create: (_) {
          var vm = sl<GameViewModel>();
          vm.prepareNewGame();
          return vm;
        },
        builder: (_, __) => Selector<GameViewModel, GameState>(
            selector: (_, viewModel) => viewModel.gameState,
            builder: (_, gameState, __) {
              if (gameState == GameState.inProgress) {
                return const GameStartedState();
              } else if (gameState == GameState.failed) {
                return const GameFailedState();
              } else if (gameState == GameState.levelCompleted) {
                return const GameFinishedState();
              }
              return const Center(
                  child: CircularProgressIndicator(
                color: MyColors.ufoGreen,
              ));
            }));
  }
}