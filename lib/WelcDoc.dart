import 'dart:io';
import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(Welcdoc());
}

File? userimage;

class Welcdoc extends StatefulWidget {
  const Welcdoc({Key? key}) : super(key: key);
  @override
  State<Welcdoc> createState() => _WelcdocState();
}

class _WelcdocState extends State<Welcdoc> {
  var namecontroller = TextEditingController();

  var emailusername;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              SizedBox(height: 80),
              Text(
                "Welcome Doctor",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Text(
                "Complete following fields",
                style: TextStyle(color: Colors.grey, fontSize: 15),
              ),
              SizedBox(height: 80),
              Stack(
                children: [
                  CircleAvatar(
                      backgroundColor: Colors.black,
                      radius: 60,
                      child: Icon(
                        Icons.person,
                        size: 50,
                      )),
                  Padding(
                    padding: const EdgeInsets.only(top: 95.0, left: 70),
                    child: IconButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => Container(
                            height: 50,
                            child: AlertDialog(
                                title: Text(
                                  '''Select an option
to pick your image''',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.grey),
                                ),
                                content: Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.17,
                                  child: Column(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                              color: Colors.grey,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        width: MediaQuery.of(context)
                                            .size
                                            .longestSide,
                                        child: TextButton(
                                          onPressed: () {
                                            getgalaryimage();
                                          },
                                          child: Text("Gallary"),
                                        ),
                                      ),
                                      SizedBox(height: 15),
                                      Container(
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                              color: Colors.grey,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        width: MediaQuery.of(context)
                                            .size
                                            .longestSide,
                                        child: TextButton(
                                          onPressed: () {
                                            getcamimage();
                                          },
                                          child: Text("Camera"),
                                        ),
                                      ),
                                    ],
                                  ),
                                )),
                          ),
                        );
                      },
                      icon: Container(
                          decoration: BoxDecoration(
                              color: Colors.blueAccent,
                              borderRadius: BorderRadius.circular(10)),
                          child: Icon(
                            Icons.add,
                            size: 30,
                          )),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15),
                child: TextFormField(
                  decoration: InputDecoration(labelText: 'Your Name '),
                  controller: namecontroller,
                  onChanged: (value) {
                    emailusername = value;
                  },
                ),
              ),
              SizedBox(height: 40),
              TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "Docpage");
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                        ),
                        borderRadius: BorderRadius.circular(15)),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        "Submit",
                        style: TextStyle(fontSize: 17, color: Colors.black),
                      ),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }

  Future getgalaryimage() async {
    try {
      var images = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (images == null) return;
      var ImageTemp = File(images.path as String);

      setState(() {
        images = ImageTemp as XFile;
      });
    } on PlatformException catch (e) {
      print(e);
    }
  }

  Future getcamimage() async {
    try {
      var images = await ImagePicker().pickImage(source: ImageSource.camera);
      if (images == null) return;
      var ImageTemp = File(images.path as String);

      setState(() {
        images = ImageTemp as XFile;
      });
    } on PlatformException catch (e) {
      print(e);
    }
  }
}
