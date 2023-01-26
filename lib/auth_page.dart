import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationServices{
  final FirebaseAuth _firebaseAuth;
  AuthenticationServices(this._firebaseAuth);
  /*Stream<User> get authStateChanges => _firebaseAuth.authStateChanges();*/

  Future SignIn(String   EmailController, String PasswordController) async{
    try {
      await _firebaseAuth.signInWithEmailAndPassword(email: EmailController,  password: PasswordController);
      return "signed in";
    }on FirebaseAuthException catch (e){
      return e.message;
    }
  }
  Future SignUp(String   EmailController, String PasswordController) async{
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(email: EmailController,  password: PasswordController);
      return "signed in";
    }on FirebaseAuthException catch (e){
      return e.message;
    }
  }




}


/*class AuthPage  {
  var EmailController = TextEditingController();

  var PasswordController = TextEditingController();

  var FormKey = GlobalKey<FormState> ();
  late final FirebaseAuth _firebaseAuth;

  Future SignIn(String EmailController, String PasswordController) async{
    try {
      await _firebaseAuth.signInWithEmailAndPassword(email: EmailController,  password: PasswordController);
      return "signed in";
    }on FirebaseAuthException catch (e){
      return e.message;
    }
  }
}*/

