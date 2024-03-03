import 'package:hangman/features/user_out/presentation/pages/hangman_page.dart';
import 'package:hangman/models/viev_models/view_model_base.dart';

class GameFinishedViewModel extends ViewModelBase {
  Future<void> startNewGame() async {
    await navigationService.navigateToPageWithReplace(const HangmanPage());
  }
}