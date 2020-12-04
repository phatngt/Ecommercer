import 'package:firebase_auth/firebase_auth.dart';

class Register {
  final String fullName, email, password, confirmPassword, gender, phoneNumber;
  FirebaseAuth auth;
  Register({
    this.fullName,
    this.email,
    this.password,
    this.confirmPassword,
    this.phoneNumber,
    this.gender = "",
  }) {
    auth = FirebaseAuth.instance;
  }

  bool checkInfoIsTyped() {}

  void registerAccountIntoFirebase() async {
    // print(this.email);
    // print(this.password);
    // print(this.confirmPassword);
    // print(this.phoneNumber);
    // print(this.gender);
    try {
      UserCredential userCredential = await this
          .auth
          .createUserWithEmailAndPassword(
              email: this.email, password: this.password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided to weak');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exist for that email');
      }
    }
  }
}
