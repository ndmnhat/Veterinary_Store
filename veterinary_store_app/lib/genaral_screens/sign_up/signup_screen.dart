import 'package:flutter/material.dart';
import 'package:veterinary_store_app/genaral_screens/sign_up/components/body_signup.dart';
// import 'package:firebase_auth/firebase_auth.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Color(0xFF085B6E)),
        elevation: 0,
      ),
      body: Body(),
    );
  }
}

// FirebaseAuth auth = FirebaseAuth.instance;

// Future<void> _createuser() async{
//   try {
//     UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
//         email: _emailController.text,
//         password: _passWordController.text
//     );
//   } on FirebaseAuthException catch (e) {
//     if (e.code == 'email-already-in-use') {
//       print('The account already exists for that email.');
//     }
//   } catch (e) {
//     print("Error: $e");
//   }
// }
