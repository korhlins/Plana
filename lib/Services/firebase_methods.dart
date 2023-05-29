import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:plana/View/screen/home_screen.dart';
import 'package:plana/View/utilities/snack_bar.dart';

class FirebaseMethods {
  FirebaseMethods({this.context});
  BuildContext? context;

  final _auth = FirebaseAuth.instance;

  Future<void> signInWithEmailAndPassword(
      {String? email, String? password}) async {
    try {
      await _auth.signInWithEmailAndPassword(
          email: email!, password: password!);
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        ScaffoldMessenger.of(context!).showSnackBar(
            showSnackBar.snackBar("No User found for that email."));
      } else if (e.code == "wrong-password") {
        ScaffoldMessenger.of(context!).showSnackBar(
            showSnackBar.snackBar("Wrong password provided for that user."));
      } else {
        Navigator.pushNamed(context!, HomeScreen.id);
      }
    }
  }
}
