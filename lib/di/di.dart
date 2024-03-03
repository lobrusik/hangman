import 'package:hangman/data_source/words_local_source.dart';
import 'package:hangman/data_source/words_memory_storage.dart';
import 'package:hangman/features/user_out/presentation/pages/home_page.dart';
import 'package:hangman/models/viev_models/game_finished_view_model.dart';
import 'package:hangman/models/viev_models/game_view_model.dart';
import 'package:hangman/repository/words_repository.dart';
//import '../main.dart';

import 'package:flutter_podstawy_utilities/services/navigation_service.dart';
import 'package:get_it/get_it.dart';

GetIt sl = GetIt.instance;

void setupServiceLocatorForHangmanApp() {
  sl.registerFactory<GameViewModel>(() => GameViewModel(sl()));
  sl.registerFactory<GameFinishedViewModel>(() => GameFinishedViewModel());

  sl.registerLazySingleton<WordsLocalSource>(() => WordsMemoryStorage());
  sl.registerLazySingleton<WordsRepository>(() => WordsRepository(sl()));
  
  sl.registerLazySingleton<NavigationService>(() => NavigationService(navigatorKey)); 
}

