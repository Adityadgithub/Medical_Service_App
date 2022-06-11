import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebasetut/select_title/Select_title.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

List Emaildatabase = ['Jarvis47'];
List passdatabase = ['Jarvis47'];
var newpassword;
var newEmail;

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key); 

  @override
  SignUpState createState() => SignUpState();
}

class SignUpState extends State<SignUp> {
  var retype;
  var auth = FirebaseAuth.instance;
  var store = FirebaseFirestore.instance;
  List Emaildatabase = ['Jarvis47'];
  List passdatabase = ['Jarvis47'];
  var changedbutton = false;
  final _formkey = GlobalKey<FormState>();

  UserCredential? newuser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SignUp"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(30, 50, 30, 60),
          child: Form(
            key: _formkey,
            child: Column(children: [
              Text(
                "Welcome New User",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.deepPurple,
                  letterSpacing: 1,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text("Create your new account"),
              TextFormField(
                validator: (value) {
                  newEmail = value;
                  for (var i in Emaildatabase) {
                    if (i == value) {
                      return "User already exists";
                    }
                  }
                },
                decoration: InputDecoration(
                    labelText: "Create Email",
                    hintText: "(ex- noddy,samwilson)"),
                onChanged: (value) {
                  newEmail = value;
                },
              ),

              TextFormField(
                validator: (pas) {
                  newpassword = pas;
                  if (newpassword.isEmpty) {
                    return "Password can't be empty";
                  }
                },
                decoration: InputDecoration(
                    labelText: "New Password",
                    hintText: "Enter a new Password"),
                onChanged: (value) {
                  newpassword = value;
                },
              ),

              //retype
              // TextFormField(
              //   validator: (value) {
              //     retype = value;
              //     if (value != password) {
              //       return "Password does'nt match";
              //     }
              //     return null;
              //   },
              //   decoration: InputDecoration(
              //       labelText: "Re-type Password",
              //       hintText: "Match the Password"),
              //   onChanged: (value) {},
              // ),
              SizedBox(height: 15),
              Material(
                color: Colors.deepPurple,
                // shape: changedbutton
                //     ? BoxShape.circle
                //     : BoxShape.rectangle,
                borderRadius: BorderRadius.circular(changedbutton ? 50 : 8),
                child: InkWell(
                  splashColor: Colors.black,
                  onTap: () async {
                    auth
                        .createUserWithEmailAndPassword(
                            email: newEmail, password: newpassword)
                        .then((signedinuser) {
                      store.collection(loginas!).add(
                          {'Name': newEmail, 'password': newpassword}).then((value) {
                        if (signedinuser != null) { loginas == "user"?
                              Navigator.pushNamed(context, "category"): Navigator.pushNamed(context,  "welcdoc");
                        }
                      });
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
                            'Signup',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                  ),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
