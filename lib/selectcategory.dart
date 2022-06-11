import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebasetut/googlesigninwidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'login/login.dart';

void main() {
  runApp(SelectCategory());
}

class SelectCategory extends StatefulWidget {
  const SelectCategory({Key? key}) : super(key: key);
  @override
  State<SelectCategory> createState() => SelectCategoryState();
}

class SelectCategoryState extends State<SelectCategory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Align(
          alignment: Alignment.topRight,
          child: Container(
            color: Colors.indigo[900],
            width: MediaQuery.of(context).size.width * 0.5,
          ),
        ),
        Column(children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.indigo[900],
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(80),
              ),
            ),
            height: MediaQuery.of(context).size.height * 0.25,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 0, left: 15, right: 15),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.camera_alt_outlined,
                          color: Colors.white,
                          size: 30,
                        ),
                        Text("Welcome, Alex!",
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold)),
                        Icon(
                          Icons.search,
                          color: Colors.white,
                          size: 30,
                        )
                      ]),
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.only(topRight: Radius.circular(60))),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 30.0, left: 30),
                      child: Row(
                        children: [
                          Text(
                            '''Our Medical \nServices''',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              TextButton(
                                onPressed: () {},
                                child: Column(
                                  children: [
                                    CircleAvatar(
                                      backgroundImage: AssetImage(
                                          "assets/images/stetho3.png"),
                                      radius: 60,
                                    ),
                                    SizedBox(height: 10),
                                    Text("General Doctor",
                                        style: TextStyle(color: Colors.black))
                                  ],
                                ),
                              ),
                              TextButton(
                                onPressed: () {},
                                child: Column(
                                  children: [
                                    CircleAvatar(
                                      backgroundImage: AssetImage(
                                          "assets/images/bonesandjoins.jpg"),
                                      radius: 60,
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      "Bones and joints",
                                      style: TextStyle(color: Colors.black),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 50),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              TextButton(
                                onPressed: () {},
                                child: Column(
                                  children: [
                                    CircleAvatar(
                                      backgroundImage: AssetImage(
                                          "assets/images/dental.jpg"),
                                      radius: 60,
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      "Dental care",
                                      style: TextStyle(color: Colors.black),
                                    )
                                  ],
                                ),
                              ),
                              TextButton(
                                onPressed: () {},
                                child: Column(
                                  children: [
                                    CircleAvatar(
                                      backgroundImage:
                                          AssetImage("assets/images/eye.png"),
                                      radius: 60,
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      "Eye Specialist",
                                      style: TextStyle(color: Colors.black),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 50),
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, "Homepage");
                            },
                            child: Column(
                              children: [
                                CircleAvatar(
                                  backgroundImage:
                                      AssetImage("assets/images/psycho.jpg"),
                                  radius: 60,
                                ),
                                SizedBox(height: 10),
                                Text(
                                  "Psychitrist",
                                  style: TextStyle(color: Colors.black),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ])
      ]),
    );
  }
}
