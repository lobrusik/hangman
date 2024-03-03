import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hangman/features/user_out/presentation/pages/hangman_page.dart';
import 'package:hangman/global/toast.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey();

class HomePage extends StatelessWidget{
  const HomePage ({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Strona główna"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Text("Witam na stronie!", style: TextStyle(fontWeight: FontWeight.bold),)),
          SizedBox(height: 30,),
          GestureDetector(
            onTap: () {
              FirebaseAuth.instance.signOut();
              MaterialApp(navigatorKey: navigatorKey, home: const HangmanPage());
              showToast(message: "Powodzenia!");
            },
            child: Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(10)
              ),
            child: Center(child: Text("Jestem gotów na ryzyko", style: TextStyle(color: Colors.white),),))
          )
        ],
      ),
    );
  }
}