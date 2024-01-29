// ignore_for_file: unnecessary_null_comparison

import 'package:ecommerce_app/services/db_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ecommerce_app/helper/helperFun.dart';

class AuthServices {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  //signin
  Future signinWithEmailAndPassword(String email, String password) async {
    try {
      User user = (await firebaseAuth.signInWithEmailAndPassword(
              email: email, password: password))
          .user!;
      if (user != null) {
        return true;
      }
    } on FirebaseAuthException catch (e) {
      print(e);
      return e.message;
    }
  }

  //signup
  Future registerUserWithEmailAndPassword(String fullName, String email,
      String password, String confirmPass, String dob) async {
    try {
      User user = (await firebaseAuth.createUserWithEmailAndPassword(
              email: email, password: password))
          .user!;
      if (user != null) {
        DatabaseServices(uid: user.uid).saveUserData(fullName, email, dob);
        return true;
      }
    } on FirebaseAuthException catch (e) {
      print(e);
      return e.message;
    }
  }

  //signout
  Future signout() async {
    try {
      await helperFun.saveUserLoggedInStatus(false);
      await helperFun.saveUserNameSp("");
      await helperFun.saveUserEmailSp("");
      await firebaseAuth.signOut();
    } catch (e) {
      return null;
    }
  }
}
