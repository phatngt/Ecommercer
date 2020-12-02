import 'package:firebase_auth/firebase_auth.dart';

class Login {
  FirebaseAuth auth;
  final String email, password;
  UserCredential _userCredential;

  Login({this.email, this.password}) {
    auth = FirebaseAuth.instance;
  }
  // createAccount() async {
  //   try {
  //     _userCredential = await auth.createUserWithEmailAndPassword(
  //         email: this.email, password: this.password);
  //   } on FirebaseAuthException catch (error) {
  //     if (error.code == 'weak-password') {
  //       print("the password provide is too weak");
  //     } else if (error.code == 'email-already-in-use') {
  //       print("The account already exits for that email");
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  Future<bool> checkAccount() async {
    try {
      _userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: this.email, password: this.password);
      return true;
    } on FirebaseAuthException catch (error) {
      if (error.code == 'user-not-found') {
        print('No user found for that email');
      } else if (error.code == 'wrong-password') {
        print('Wrong password provided for that user');
      }
      return false;
    }
  }
}
