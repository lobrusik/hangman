import 'package:hangman/data_source/words_local_source.dart';
import 'package:hangman/data_source/words_memory_storage.dart';
import 'package:hangman/features/user_out/presentation/pages/home_page.dart';
import 'package:hangman/models/viev_models/game_finished_view_model.dart';
import 'package:hangman/models/viev_models/game_view_model.dart';
import 'package:hangman/repository/words_repository.dart';

import 'package:flutter_podstawy_utilities/services/navigation_service.dart';
import 'package:get_it/get_it.dart';

//Global service locator instance
GetIt sl = GetIt.instance;

//Function to set up service locator for the Hangman app void. Registering factories and lazy singletons for dependency injection 
void setupServiceLocatorForHangmanApp() {
  
  //Factory registration for GameViewModel
  sl.registerFactory<GameViewModel>(() => GameViewModel(sl()));
  //// Factory registration for GameFinishedViewModel
  sl.registerFactory<GameFinishedViewModel>(() => GameFinishedViewModel());

  //Lazy singleton registration for WordsLocalSource, using WordsMemoryStorage implementation
  sl.registerLazySingleton<WordsLocalSource>(() => WordsMemoryStorage());
  //Lazy singleton registration for WordsRepository
  sl.registerLazySingleton<WordsRepository>(() => WordsRepository(sl()));
  
  //Lazy singleton registration for NavigationService, delivered in home_page.dart
  sl.registerLazySingleton<NavigationService>(() => NavigationService(navigatorKey)); 
}

