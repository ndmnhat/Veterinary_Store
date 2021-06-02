import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:veterinary_store_app/controllers/auth_controller.dart';
import 'package:get/get.dart';
import 'package:veterinary_store_app/controllers/utilities_controller.dart';
import 'package:veterinary_store_app/screens/signup_screen.dart';
import 'package:veterinary_store_app/screens/forgotpassword_screen.dart';


class SignIn extends GetWidget<UtilitiesController>{
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController _emailInputCtrl = TextEditingController();
  final TextEditingController _passwordInputCtrl = TextEditingController();

  final AuthController _authCtrl = Get.find();

  handleFormSubmit() async {
    await _authCtrl.login(_emailInputCtrl.text, _passwordInputCtrl.text);
  }
  @override
  Widget build(BuildContext context) {
    return GetBuilder<UtilitiesController>(
        builder: (controller){
      return Scaffold(
          key: _scaffoldKey,
          body: Container(
            padding: EdgeInsets.fromLTRB(30, 18, 30, 10),
            constraints: BoxConstraints.expand(),
            height: Get.height,
            color: Colors.white,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Center(
                    child: Container(
                        width: 220,
                        height: 220,
                        child: Image(
                          image: AssetImage('assets/logo.png'),
                        )
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                      "Hello\nWelcome back boss",
                      style: TextStyle(
                          fontSize: 29,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.5,
                          color: Colors.black,
                          fontFamily: 'Shrikhand'
                      )
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                        child: StreamBuilder(
                          builder: (context, snapshot) => TextField(
                            cursorColor: Color(0xFF085B6E),
                            controller: _emailInputCtrl,
                            style: TextStyle(color: Colors.black,fontSize: 25),
                            decoration: InputDecoration(
                                labelText: "Email",
                                labelStyle: TextStyle(color: Colors.grey,fontSize: 20,),
                                errorText: snapshot.hasError ? snapshot.error : null,
                                prefixIcon: Container(width: 50,
                                  child: Icon(Icons.email, color: Colors.black, size: 30,),
                                ),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey , width: 1),
                                  borderRadius: BorderRadius.all(Radius.circular(6)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Color(0xFF085B6E), width: 1),
                                  borderRadius: BorderRadius.all(Radius.circular(6)),
                                )
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                        child: StreamBuilder(
                          builder: (context, snapshot) =>  TextField(
                            cursorColor: Color(0xFF085B6E),
                            style: TextStyle(color: Colors.black,fontSize: 25),
                            controller: _passwordInputCtrl,
                            obscureText: !controller.showPass,
                            decoration: InputDecoration(
                              labelText: "Password",
                              labelStyle: TextStyle(color: Colors.grey,fontSize: 20,),
                              errorText: snapshot.hasError ? snapshot.error : null,
                              prefixIcon: Container(width: 50,
                                child: Icon(Icons.lock, color: Colors.black, size: 30,),
                              ),
                              suffixIcon: IconButton(
                                onPressed: () { controller.showPassword();},
                                icon: Icon(
                                  controller.showPass ? Icons.visibility_off : Icons.visibility,
                                  color: Colors.black,
                                  size: 30,
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey , width:1),
                                borderRadius: BorderRadius.all(Radius.circular(6)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Color(0xFF085B6E) , width:1),
                                borderRadius: BorderRadius.all(Radius.circular(6)),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 30, 0, 10),
                        child: SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: MaterialButton(
                              onPressed: handleFormSubmit,
                              color: Color(0xFF085B6E),
                              child: Text("Sign in" ,style: TextStyle(fontSize: 25, color: Colors.grey[50]))
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                      padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {
                              Get.to(()=>ForgotPasswordScreen());
                            },
                            child: Text(
                              " FORGOT PASSWORD", style: TextStyle(fontSize: 15,color: Color(0xFF085B6E)),
                            ),
                          )
                        ],
                      )
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                          child: RichText(
                            text: TextSpan(
                                text: "New user ?",
                                style: TextStyle(fontSize: 15,color: Colors.grey ),
                                children: <TextSpan>[
                                  TextSpan(
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        Get.to(()=>SignUp());
                                      },
                                    text: " Sign up",
                                    style: TextStyle(fontSize: 15,color: Color(0xFF085B6E)),
                                  )
                                ]
                            ),
                          ),
                        ),
                      ]
                  )
                ],
              ),
            ),
          ),
        );
      }
    );
  }
}
