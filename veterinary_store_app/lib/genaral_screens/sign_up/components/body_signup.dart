import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB( 30, 0, 30, 10),
      constraints: BoxConstraints.expand(),
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            SignUpForm(),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 90, 0, 0),
                    child: RichText(
                      text: TextSpan(
                          text: "already have an account ?",
                          style: TextStyle(fontSize: 15,color: Colors.grey ),
                          children: <TextSpan>[
                            TextSpan(
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.pop(context);
                                },
                              text: " Sign in",
                              style: TextStyle(fontSize: 15,color: Colors.blue ),
                            )
                          ]
                      )
                    ),
                  ),
                ]
            )
          ],
        ),
      ),
    );
  }
}

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {

  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passWordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        userForm(),
        phoneForm(),
        emailForm(),
        passForm(),
        confinepassForm(),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 20, 0, 10),
          child: SizedBox(
            width: double.infinity,
            height: 50,
            child: MaterialButton(
              onPressed: onSignUpClick,
              color: Colors.blue,
              child: Text("Sign up" ,style: TextStyle(fontSize: 25, color: Colors.white)),),
          ),
        ),
      ],
    );
  }

  Padding userForm() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 20, 0, 00),
      child: TextField(
        style: TextStyle(color: Colors.black,fontSize: 25),
        decoration: InputDecoration(
          labelText: "Username",
          labelStyle: TextStyle(color: Colors.grey,fontSize: 20,),
          prefixIcon: Container(
            width: 50,
            child: Icon(
              Icons.person,
              color: Colors.black,
              size: 30,
            ),
          ),
          border: OutlineInputBorder(
            borderSide:
            BorderSide(color: Colors.grey , width:1),
            borderRadius:
            BorderRadius.all(Radius.circular(6)),
          ),
        ),
      ),
    );
  }

  Padding phoneForm(){
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 20, 0, 00),
      child: TextField(
        style: TextStyle(color: Colors.black,fontSize: 25),
        decoration: InputDecoration(
          labelText: "Phonenumber",
          labelStyle: TextStyle(color: Colors.grey,fontSize: 20,),
          prefixIcon: Container(
            width: 50,
            child: Icon(
              Icons.phone,
              color: Colors.black,
              size: 30,
            ),
          ),
          border: OutlineInputBorder(
            borderSide:
            BorderSide(color: Colors.grey , width:1),
            borderRadius:
            BorderRadius.all(Radius.circular(6)),
          ),
        ),
      ),
    );
  }

  Padding emailForm() {
    return  Padding(
      padding: const EdgeInsets.fromLTRB(0, 20, 0, 00),
      child: TextField(
        controller: _emailController,
        style: TextStyle(color: Colors.black,fontSize: 25),
        decoration: InputDecoration(
          labelText: "Email",
          labelStyle: TextStyle(color: Colors.grey,fontSize: 20,),
          prefixIcon: Container(
            width: 50,
            child: Icon(
              Icons.mail_outline,
              color: Colors.black,
              size: 30,
            ),
          ),
          border: OutlineInputBorder(
            borderSide:
            BorderSide(color: Colors.grey , width:1),
            borderRadius:
            BorderRadius.all(Radius.circular(6)),
          ),
        ),
      ),
    );
  }

  Padding passForm() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
      child: TextField(
        controller: _passWordController,
        style: TextStyle(color: Colors.black,fontSize: 25),
        // obscureText: !_showPass,
        decoration: InputDecoration(
          labelText: "Password",
          labelStyle: TextStyle(color: Colors.grey,fontSize: 20,),
          prefixIcon: Container(
            width: 50,
            child: Icon(
              Icons.lock,
              color: Colors.black,
              size: 30,
            ),
          ),
          border: OutlineInputBorder(
            borderSide:
            BorderSide(color: Colors.grey , width:1),
            borderRadius:
            BorderRadius.all(Radius.circular(6)),
          ),
        ),
      ),
    );
  }

  Padding confinepassForm() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
      child: TextField(
        style: TextStyle(color: Colors.black,fontSize: 25),
        // obscureText: !_showPass,
        decoration: InputDecoration(
          labelText: "Confirm Password",
          labelStyle: TextStyle(color: Colors.grey,fontSize: 20,),
          prefixIcon: Container(
            width: 50,
            child: Icon(
              Icons.lock,
              color: Colors.black,
              size: 30,
            ),
          ),
          border: OutlineInputBorder(
            borderSide:
            BorderSide(color: Colors.grey , width:1),
            borderRadius:
            BorderRadius.all(Radius.circular(6)),
          ),
        ),
      ),
    );
  }

  void onSignUpClick() {
    // _createuser();
  }
}

