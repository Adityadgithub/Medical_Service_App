import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebasetut/select_title/Select_title.dart';
import 'package:firebasetut/googlesigninwidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:flutter_signin_button/flutter_signin_button.dart';

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {
  var changedbutton = false;
  var Email;
  var password;
  var Exists;
  var uname = "";
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Login/Sign In",
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            child: Form(
              key: _formkey,
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Welcome $uname",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Column(
                    children: [
                      TextFormField(
                        validator: (value) {
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: "Enter Username (ex. chaddy)",
                          labelText: "Username",
                          labelStyle: TextStyle(fontSize: 20),
                        ),
                        onChanged: (value) {
                          Email = value;
                        },
                      ),
                      TextFormField(
                        onChanged: (pass) {
                          password = pass;
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Password cannot be empty";
                          } else if (value.length < 8) {
                            return "Atleast 8 characters required";
                          }

                          return null;
                        },
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: "Enter Password",
                          labelText: "Password",
                          labelStyle: TextStyle(fontSize: 20),
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Material(
                        color: Colors.deepPurple,
                        // shape: changedbutton
                        //     ? BoxShape.circle
                        //     : BoxShape.rectangle,
                        borderRadius:
                            BorderRadius.circular(changedbutton ? 50 : 8),
                        child: InkWell(
                          splashColor: Colors.black,
                          onTap: () async {
                            setState(() {});
                            changedbutton = true;

                            // FirebaseAuth.instance
                            //     .signInWithEmailAndPassword(
                            //         email: Email, password: password)
                            //     .then((value) {
                            //   Navigator.pushNamed(context, "Homepage");
                            // }).catchError((e) {
                            //   print(e);
                            // });

                            FirebaseAuth.instance
                                .signInWithEmailAndPassword(
                                    email: Email, password: password)
                                .then((FirebaseUser) {
                              ;
                              loginas == "user"
                                  ? Navigator.pushNamed(context, "category")
                                  : Navigator.pushNamed(context, "welcdoc");
                            }).catchError((e) {
                              print(e);
                            });
                          },
                          onDoubleTap: () {
                            changedbutton = false;
                            setState(() {});
                          },
                          child: AnimatedContainer(
                            duration: Duration(seconds: 1),
                            width: changedbutton ? 50 : 150,
                            height: 50,
                            alignment: Alignment.center,
                            child: changedbutton
                                ? Text(
                                    '...',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  )
                                : Text(
                                    'Login',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      SignInButton(text: "SignIn", Buttons.Google,
                          onPressed: () {
                        setState(() {});
                        signinwithgoogle().then((onValue) {
                          FirebaseFirestore.instance.collection(loginas!)
                              // .doc('auth').
                              // .collection('guest')
                              .add({
                            'email': uemail,
                            'image': imageurl,
                            'name': name
                          });
                        }).then((value) {
                          loginas == "user"
                              ? Navigator.pushNamed(context, "category")
                              : Navigator.pushNamed(context, "welcdoc");
                        }).catchError((e) {
                          print(e);
                        });
                      })
                      // ElevatedButton(099
                      //   child: Text("Login"),+-
                      //   style: TextButton.styleFrom(
                      //     minimumSize: Size(120, 40),
                      //   ),
                      //   onPressed: () {
                      //     Navigator.pushNamed(context, myRoutes.homepage);
                      //   },
                      // ),
                      ,
                      TextButton(
                        child: Text("SignUp/Register new account"),
                        onPressed: () {
                          Navigator.pushNamed(context, "signup");
                        },
                      ),
                    ],
                  ),
                ],
                crossAxisAlignment: CrossAxisAlignment.center,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
