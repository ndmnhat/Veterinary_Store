import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:veterinary_store_app/bindings/Instancebinding.dart';
import 'package:veterinary_store_app/bindings/isSignin.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // InstanceBinding().dependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: InstanceBinding(),
      title: 'Flutter Demo',
      home: IsSignedIn(),
    );
  }
}


