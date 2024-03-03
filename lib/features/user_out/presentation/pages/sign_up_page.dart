import 'package:firebase_auth/firebase_auth.dart';
//import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hangman/features/user_out/firebase_auth_implementation/firebase_auth_services.dart';
import 'package:hangman/features/user_out/presentation/pages/hangman_page.dart';
//import 'package:hangman/features/user_out/presentation/pages/home_page.dart';
import 'package:hangman/features/user_out/presentation/pages/login_page.dart';
import 'package:hangman/features/user_out/presentation/widgets/form_container_widget.dart';
import 'package:hangman/global/toast.dart';

class SignUpPage extends StatefulWidget{
  const SignUpPage({super.key});
  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage>{
  bool _isSigningUp = false;
  final FirebaseAuthService _auth = FirebaseAuthService();

  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  void dispose(){
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Zalóż konto"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Utwórz swoje konto", style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold)
            ),
            SizedBox(
              height: 30,
            ),

            FormContainerWidget(
              controller: _usernameController,
              hintText: "Login",
              isPasswordField: false,
            ),
            SizedBox(height: 10),

            FormContainerWidget(
              controller: _emailController,
              hintText: "Email",
              isPasswordField: false,
            ),
            SizedBox(height: 10,),

            FormContainerWidget(
              controller: _passwordController,
              hintText: "Hasło",
              isPasswordField: true,
            ),
            SizedBox(height: 30,),
            GestureDetector(
              onTap: _signUp,
              child: Container(
                width: double.infinity,
                height: 45,
                decoration: BoxDecoration(
                  color: Colors.blue, 
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Center(child: _isSigningUp ? CircularProgressIndicator(color: Colors.white,): 
                  Text("Załóż konto", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),),
              ),
            ),
            SizedBox(height: 20,),
            Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Masz już konto?"),
              SizedBox(width: 5,),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
                },
                child: Text("Zaloguj się", style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),)
              )
            ],) 
          ],
        ))
        
      )
    );
  }

  void _signUp() async {
    setState(() {
      _isSigningUp = true;
    });
    //String username = _usernameController.text;
    String email = _emailController.text;
    String password = _passwordController.text;

    User? user = await _auth.signUpWithEmailAndPassword(email, password);
    setState(() {
      _isSigningUp = false;
    });

    if (user !=null){
      showToast(message: "Konto zostało utworzone");
      Navigator.push(context, MaterialPageRoute(builder: (context) => HangmanPage()));
    } else showToast(message: "Nie udało się utworzyć konta.");
  }
}
