import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hangman/features/user_out/firebase_auth_implementation/firebase_auth_services.dart';
import 'package:hangman/features/user_out/presentation/pages/hangman_page.dart';
import 'package:hangman/features/user_out/presentation/pages/sign_up_page.dart';
import 'package:hangman/features/user_out/presentation/widgets/form_container_widget.dart';
import 'package:hangman/global/toast.dart';

//A page for user login.
class LoginPage extends StatefulWidget{
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>{

  bool _isSigning = false;
  final FirebaseAuthService _auth = FirebaseAuthService();

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  void dispose(){
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Logowanie"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Zaloguj się", style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold)
            ),
            SizedBox(
              height: 30,
            ),
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
              onTap: _signIn,
              child:Container(
                width: double.infinity,
                height: 45,
                decoration: BoxDecoration(
                  color: Colors.blue, 
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Center(child: _isSigning ? CircularProgressIndicator(color: Colors.white,): Text("Zaloguj", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),)
              ),
            ),
            
            SizedBox(height: 20,),
            Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Nie masz konta?"),
              SizedBox(width: 5,),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpPage()));
                },
                child: Text("Załóż konto", 
                  style: TextStyle(
                    color: Colors.blue, 
                    fontWeight: FontWeight.bold),)
              )
            ],)
          ],
        ))
        
      )
    );
  }
  //Signs in the user with provided email and password.
  void _signIn() async {
    setState(() {
      _isSigning = true;
    });
    
    String email = _emailController.text;
    String password = _passwordController.text;

    User? user = await _auth.signInWithEmailAndPassword(email, password);

    setState(() {
      _isSigning = false;
    });

    if (user !=null){
      showToast(message: "Zalogowano");
      Navigator.push(context, MaterialPageRoute(builder: (context) => HangmanPage()));
    } else showToast(message:"Nie udało się zalogować.");
  }
}