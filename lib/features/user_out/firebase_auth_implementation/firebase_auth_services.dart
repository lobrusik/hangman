import 'package:firebase_auth/firebase_auth.dart';
import 'package:hangman/global/toast.dart';

class FirebaseAuthService {
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> signUpWithEmailAndPassword(String email, String password) async {
    try{
      UserCredential credential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      return credential.user;
    } on FirebaseAuthException catch (e){
      if (e.code == 'email-already-in-use'){
        showToast(message: 'istnieje już użytkownik o tym adresie mailowym');
      } else{
        showToast(message: 'błąd: ${e.code}');
      }
    }
    return null;
  }

  Future<User?> signInWithEmailAndPassword(String email, String password) async {
    try{
      UserCredential credential = await _auth.signInWithEmailAndPassword(email: email, password: password);
      return credential.user;
    } on FirebaseAuthException catch (e){
      if (e.code == 'user-not-found' || e.code == 'wrong-password'){
        showToast(message: 'nieprawidłowy mail lub hasło');
      } else{
        showToast(message: 'błąd: ${e.code}');
        }
      }
    return null;
  }
}
