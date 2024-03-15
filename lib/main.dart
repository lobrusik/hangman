import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hangman/di/di.dart';
import 'package:hangman/features/user_out/presentation/pages/login_page.dart';

//It's a global key of type NavigatorState used to control the app's navigation.
final GlobalKey<NavigatorState> navigationKey = GlobalKey();

//It's an asynchronous function that initializes Firebase, sets up the service locator, and ensures Flutter is initialized for web.
Future main() async{
  setupServiceLocatorForHangmanApp();
  WidgetsFlutterBinding.ensureInitialized();

  if(kIsWeb){
    await Firebase.initializeApp(options: FirebaseOptions(
      apiKey: "AIzaSyDl6rkpvcA-qeB95skxvS8KWRKh4CwbC2c",
      authDomain: "hangman-6693a.firebaseapp.com",
      projectId: "hangman-6693a",
      storageBucket: "hangman-6693a.appspot.com",
      messagingSenderId: "1024931392834",
      appId: "1:1024931392834:web:b6b7e48424392480c36cdb"
    ),);
  }
  await Firebase.initializeApp();
  runApp(const MyApp());
}

//This is a stateless widget representing the root of the Hangman application.
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigationKey,
      debugShowCheckedModeBanner: false,
      title: 'Wisielec',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 5, 65, 21)),
        useMaterial3: true,
      ),
      //The home property is set to the LoginPage, indicating that the login page is the initial screen of the application.
      home: const LoginPage(),
    );
  }
}