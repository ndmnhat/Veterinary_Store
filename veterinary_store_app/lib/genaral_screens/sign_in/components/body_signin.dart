import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:veterinary_store_app/genaral_screens/sign_up/signup_screen.dart';
import 'package:veterinary_store_app/user/screens/navbar_router/app_screen.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(30, 70, 30, 10),
      constraints: BoxConstraints.expand(),
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
              child: Container(
                alignment: Alignment.center,
                width: 100,
                height: 100,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,color: Colors.grey,
                ),
                child: Icon(
                  Icons.pets,
                  color: Colors.black,
                  size: 60.0,
                ),),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 40, 0, 00),
              child: Text("Hello\nWelcome back boss", style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              )),
            ),
            SignInForm(),
            Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      " FORGOT PASSWORD", style: TextStyle(fontSize: 15,color: Colors.blue),
                    )
                  ],
                )
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 100, 0, 0),
                    child: RichText(
                        text: TextSpan(
                            text: "New user ?",
                            style: TextStyle(fontSize: 15,color: Colors.grey ),
                            children: <TextSpan>[
                              TextSpan(
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp(),));
                                  },
                                text: " Sign up",
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



class SignInForm extends StatefulWidget {
  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {

  TextEditingController _userNameController = new TextEditingController();
  TextEditingController _passWordController = new TextEditingController();
  bool _showPass = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        emailForm(),
        passForm(),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 20, 0, 10),
          child: SizedBox(
            width: double.infinity,
            height: 50,
            child: MaterialButton(
              onPressed: onSignInClick,
              color: Colors.blue,
              child: Text("Sign in" ,style: TextStyle(fontSize: 25, color: Colors.white)),),
          ),
        ),
      ],
    );
  }

  Padding emailForm(){
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 20, 0, 00),
      child: StreamBuilder(
        builder: (context, snapshot) => TextField(
          style: TextStyle(color: Colors.black,fontSize: 25),
          controller: _userNameController,
          decoration: InputDecoration(
            labelText: "Username",
            labelStyle: TextStyle(color: Colors.grey,fontSize: 20,),
            errorText: snapshot.hasError ? snapshot.error : null,
            prefixIcon: Container(width: 50,
              child: Icon(Icons.person, color: Colors.black, size: 30,),
            ),
            border: OutlineInputBorder(
              borderSide:
              BorderSide(color: Colors.grey , width:1),
              borderRadius:
              BorderRadius.all(Radius.circular(6)),
            ),
          ),
        ),
      ),
    );
  }

  Padding passForm(){
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
      child: StreamBuilder(
        builder: (context, snapshot) =>  TextField(
          style: TextStyle(color: Colors.black,fontSize: 25),
          controller: _passWordController,
          obscureText: !_showPass,
          decoration: InputDecoration(
            labelText: "Password",
            labelStyle: TextStyle(color: Colors.grey,fontSize: 20,),
            errorText: snapshot.hasError ? snapshot.error : null,
            prefixIcon: Container(width: 50,
              child: Icon(Icons.lock, color: Colors.black, size: 30,),
            ),
            suffixIcon: IconButton(
              onPressed: showPassword,
              icon: Icon(
                _showPass ? Icons.visibility_off : Icons.visibility,
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
      ),
    );
  }

  void showPassword(){
    setState(() {
      _showPass =!_showPass;
    });
  }

  void onSignInClick() {
    if(_userNameController.text == "user@gmail.com" && _passWordController.text == "123456")
    {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => AppScreen()),
            (Route<dynamic> route) => false,
      );
    }
    else{
      print("false");
    }
  }
}

