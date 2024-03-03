import 'package:firebase_auth/firebase_auth.dart';
import 'package:hangman/enums/game_state.dart';
import 'package:hangman/features/user_out/presentation/pages/game_finished_page.dart';
import 'package:hangman/global/toast.dart';
import 'package:hangman/models/letter.dart';
import 'package:hangman/models/viev_models/view_model_base.dart';
import 'package:hangman/models/word_to_guess.dart';
import 'package:hangman/repository/words_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class GameViewModel extends ViewModelBase {
  static const int maxAttempts = 10;
  static const String toGuessSign = "_";

  GameState _gameState = GameState.notInitialized;
  List<String> _attemptedLetters = [];
  int _currentLevel = 0;
  int _attempts = 0;
  int _playerLevel = 1;

  final WordsRepository _wordsRepository;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  GameViewModel(this._wordsRepository);

  WordToGuess _wordToGuess = WordToGuess.empty();

  List<String> get attemptedLetters => _attemptedLetters;

  GameState get gameState => _gameState;

  int get attempts => _attempts;

  int get playerLevel => _playerLevel;

  WordToGuess get wordToGuess => _wordToGuess;

  Future<void> prepareNewGame() async {
    _currentLevel = 0;
    await _prepareNewLevel();
    notifyListeners();
  }

  Future<void> prepareNextLevel() async {
    await _prepareNewLevel();
    notifyListeners();
  }

  Future<void> letterClicked(String selectedLetter) async {
    if (_attemptedLetters.contains(selectedLetter)) {
      return;
    }
    _attemptedLetters = [..._attemptedLetters, selectedLetter];

    bool isCorrectLetter = _isCorrectLetterSelected(selectedLetter);
    if (!isCorrectLetter) {
      _proceedForWrongSelectedLetter();
      return;
    } else {
      var updatedLetters = _uncoverTheLetter(selectedLetter);
      _wordToGuess = WordToGuess(updatedLetters);
    }

    bool levelCompleted =
        !_wordToGuess.letters.any((element) => element.value == toGuessSign);

    bool gameCompleted =
        (_currentLevel >= await _wordsRepository.getWordsCount());

    if (gameCompleted) {
      await _updatePlayerLevel();
      await navigationService
          .navigateToPageWithReplace(const GameFinishedPage());
      return;
    }

    if (levelCompleted) {
      _gameState = GameState.levelCompleted;
      notifyListeners();
      return;
    }

    notifyListeners();
  }

  Future<void> _prepareNewLevel() async {
    _attemptedLetters.clear();
    _attempts = 0;

    _gameState = GameState.notInitialized;

    await Future.delayed(const Duration(seconds: 1));

    var wordToGuess = await _wordsRepository.getWord(_currentLevel);
    _currentLevel++;

    var letters = <Letter>[];
    letters = wordToGuess
        .split('')
        .map((letter) => Letter(toGuessSign, letter))
        .toList();

    _wordToGuess = WordToGuess(letters);
    _gameState = GameState.inProgress;
    _playerLevel = await _getCurrentPlayerLevel();
  }

  Future<void> _updatePlayerLevel() async{
    try{
      User? currentUser = _auth.currentUser;
      if (currentUser != null){
        await _firestore.collection('players').doc('player_id').set(
        {
          'level': _playerLevel + 1,
        },
        SetOptions(merge: true)
        );
      }
    } catch (e){
      showToast(message: "Błąd aktualizacji poziomu gracza: $e");
    }
  }

  Future<int> _getCurrentPlayerLevel() async{
    try{
      User? currentUser = _auth.currentUser;
      if (currentUser != null){
        var snapshot = await _firestore.collection('players').doc('currentUser.uid').get();
        if (snapshot.exists) {
          return snapshot.data()?['level'] ?? 1;
        } else {
          return 1;
        }
      } else{
        return 1;
      }
    } catch (e) {
      showToast(message: "Błąd pobierania poziomu gracza: $e");
      return 1;
    }
  }

  bool _isCorrectLetterSelected(String letterToCheck) =>
      _wordToGuess.letters.any((letter) =>
          letter.valueToGuess.toLowerCase() == letterToCheck.toLowerCase());

  void _proceedForWrongSelectedLetter() {
    _attempts++;
    bool attemptsAchieved = _attempts == maxAttempts;

    if (attemptsAchieved) {
      _gameState = GameState.failed;
    }

    notifyListeners();
  }

  List<Letter> _uncoverTheLetter(String letterToUncover) {
    var letters = [..._wordToGuess.letters];

    for (int i = 0; i < _wordToGuess.letters.length; i++) {
      String letter = _wordToGuess.letters[i].valueToGuess;

      if (letter.toLowerCase() == letterToUncover.toLowerCase()) {
        letters[i] = Letter(letterToUncover, letterToUncover);
      }
    }
    return letters;
  }
}