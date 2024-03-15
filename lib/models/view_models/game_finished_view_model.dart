import 'package:hangman/features/user_out/presentation/pages/hangman_page.dart';
import 'package:hangman/models/view_models/view_model_base.dart';

//Handle the logic related to the "Game Finished" state in the Hangman game.
class GameFinishedViewModel extends ViewModelBase {
  Future<void> startNewGame() async {
    await navigationService.navigateToPageWithReplace(const HangmanPage());
  }
}