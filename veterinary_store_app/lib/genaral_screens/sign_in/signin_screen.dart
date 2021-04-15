import 'package:flutter/material.dart';
import 'package:veterinary_store_app/genaral_screens/sign_in/components/body_signin.dart';
// import 'package:firebase_auth/firebase_auth.dart';


class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }

  // Future<void> _login() async{
  //   try {
  //     UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
  //         email: _userNameController.text,
  //         password: _passWordController.text
  //     );
  //     if (userCredential != null) {
  //       Navigator.push(this.context, MaterialPageRoute(builder: (context) => SignIn(),));
  //     }
  //   } on FirebaseAuthException catch (e) {
  //     if (e.code == 'user-not-found') {
  //       print('No user found for that email.');
  //     } else if (e.code == 'wrong-password') {
  //       print('Wrong password provided for that user.');
  //     }
  //   }
  // }
}
