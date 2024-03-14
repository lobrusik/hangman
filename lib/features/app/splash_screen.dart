import 'package:flutter/material.dart';

//A widget representing the splash screen of the game
class SplashScreen extends StatefulWidget{
  final Widget? child;
  //Constructs a SplashScreen widget. The optional parameter [child] represents the widget to navigate to after the splash screen.
  
  const SplashScreen({super.key, this.child});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>{
  @override
  void initState(){
    //Delay for 3 seconds before navigating to the next screen
    Future.delayed(
      Duration(seconds: 3),(){
        //Navigate to the child widget and remove all routes below it
        Navigator.pushAndRemoveUntil(
          context, 
          MaterialPageRoute(builder: (context) => widget.child!),
          (route) => false
        );
      }
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Center(
        child: Text(
          "Witaj w grze, w której za nieznajomość języka polskiego możesz zawisnąć.", 
          style: TextStyle(
            color: Colors.blue, 
            fontWeight: FontWeight.bold
          ),
        ),
      )
    );
  }
}