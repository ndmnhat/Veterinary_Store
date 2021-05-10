import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:veterinary_store_app/controllers/auth_controller.dart';
import 'package:get/get.dart';

class SignUp extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController _emailInputCtrl = TextEditingController();
  final TextEditingController _passwordInputCtrl = TextEditingController();
  final TextEditingController _confirmpasswordInputCtrl = TextEditingController();
  final TextEditingController _nameInputCtrl = TextEditingController();
  final TextEditingController _phoneInputCtrl = TextEditingController();

  final AuthController _authCtrl = Get.find();

  handleFormSubmit() async {
    if(_passwordInputCtrl.text == _confirmpasswordInputCtrl.text){
      await _authCtrl.register(_nameInputCtrl.text,_emailInputCtrl.text,_phoneInputCtrl.text,_passwordInputCtrl.text,"");
    }
    else{
      Get.snackbar("Error", "Confirm password not correct!!!");
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Color(0xFF085B6E)),
        elevation: 0,
    ),
      body: Container(
        padding: EdgeInsets.fromLTRB( 30, 0, 30, 10),
        constraints: BoxConstraints.expand(),
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 20, 0, 00),
                    child: TextField(
                      cursorColor: Color(0xFF085B6E),
                      controller: _nameInputCtrl,
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
                            BorderSide(color: Colors.grey , width: 1),
                            borderRadius:
                            BorderRadius.all(Radius.circular(6)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(color: Color(0xFF085B6E) , width: 1),
                            borderRadius:
                            BorderRadius.all(Radius.circular(6)),
                          )
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 20, 0, 00),
                    child: TextField(
                      cursorColor: Color(0xFF085B6E),
                      controller: _phoneInputCtrl,
                      style: TextStyle(color: Colors.black,fontSize: 25),
                      decoration: InputDecoration(
                        labelText: "Phonenumber",
                        labelStyle: TextStyle(color: Colors.grey, fontSize: 20),
                        prefixIcon: Container(
                          width: 50,
                          child: Icon(
                            Icons.phone,
                            color: Colors.black,
                            size: 30,
                          ),
                        ),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey , width: 1),
                            borderRadius: BorderRadius.all(Radius.circular(6))
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF085B6E) , width: 1),
                            borderRadius: BorderRadius.all(Radius.circular(6))
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 20, 0, 00),
                    child: TextField(
                      cursorColor: Color(0xFF085B6E),
                      controller: _emailInputCtrl,
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
                          borderSide: BorderSide(color: Colors.grey, width: 1),
                          borderRadius: BorderRadius.all(Radius.circular(6)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF085B6E), width: 1),
                          borderRadius: BorderRadius.all(Radius.circular(6)),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: TextField(
                      cursorColor: Color(0xFF085B6E),
                      controller: _passwordInputCtrl,
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
                          borderSide: BorderSide(color: Colors.grey, width: 1),
                          borderRadius: BorderRadius.all(Radius.circular(6)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF085B6E), width: 1),
                          borderRadius: BorderRadius.all(Radius.circular(6)),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: TextField(
                      cursorColor: Color(0xFF085B6E),
                      controller: _confirmpasswordInputCtrl,
                      style: TextStyle(color: Colors.black,fontSize: 25),
                      decoration: InputDecoration(
                        labelText: "Confirm Password",
                        labelStyle: TextStyle(color: Colors.grey, fontSize: 20,),
                        prefixIcon: Container(
                          width: 50,
                          child: Icon(
                            Icons.lock,
                            color: Colors.black,
                            size: 30,
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey, width: 1),
                          borderRadius: BorderRadius.all(Radius.circular(6)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF085B6E), width: 1),
                          borderRadius: BorderRadius.all(Radius.circular(6)),
                        ),
                      ),
                    ),
                  ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                  child: SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: MaterialButton(
                        onPressed: handleFormSubmit,
                        color: Color(0xFF085B6E),
                        child: Text("Sign up" ,style: TextStyle(fontSize: 25, color: Colors.grey[50]))
                    ),
                  ),
                ),
                ],
              ),
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
                                  ..onTap = () {Get.back();},
                                text: " Sign in",
                                style: TextStyle(fontSize: 15,color: Color(0xFF085B6E)),
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
      ),
    );
  }
}
