import 'package:firebase_core/firebase_core.dart';
import 'package:firebasetut/select_title/Select_title.dart';
import 'package:firebasetut/WelcDoc.dart';
import 'package:firebasetut/dochomepage.dart';
import 'package:firebasetut/selectcategory.dart';
import 'package:firebasetut/login/login.dart';
import 'package:firebasetut/signup.dart';
import 'package:firebasetut/Firebasecard.dart';
import 'package:flutter/material.dart';

import 'Hompage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "signup": (context) => SignUp(),
        "Homepage": (context) => Homepage(),
        "login": (context) => login(),
        "category": (context) => SelectCategory(),
        "Docpage": (context) => Docpage(),
        "Firebasecard": (context) => Firebasecard(),
        "welcdoc": (context) => Welcdoc(),
      },
      home: Selecttitle(),
    );
  }
}
