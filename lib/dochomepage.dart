import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebasetut/Hompage.dart';
import 'package:firebasetut/googlesigninwidget.dart';
import 'package:firebasetut/Firebasecard.dart';
import 'package:flutter/material.dart';

import 'chatcard.dart';

var namee;
var speciality;
var language;
var xp;
var rates;

class Docpage extends StatefulWidget {
  const Docpage({Key? key}) : super(key: key);
  @override
  State<Docpage> createState() => DocpageState();
}

class DocpageState extends State<Docpage> with TickerProviderStateMixin {
  late TabController _controller;
  @override
  void initState() {
    super.initState();
    _controller = TabController(
      initialIndex: 0,
      length: 3,
      vsync: this,
    );
  }

  void refresh(int) {
    setState(() {});
  }

  var doclist = [];
  final namecontroller = TextEditingController();
  final Speacialitycontroller = TextEditingController();
  final Langcontroller = TextEditingController();
  final Expcontroller = TextEditingController();
  final ratescontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 25.0),
        child: FloatingActionButton(
          backgroundColor: Colors.red[600],
          onPressed: () {},
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Icon(Icons.message_outlined, size: 35, color: Colors.white),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Container(
              color: Colors.indigo[900],
              width: MediaQuery.of(context).size.width * 0.5,
            ),
          ),
          Column(
            children: [
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
                      padding:
                          const EdgeInsets.only(top: 0, left: 15, right: 15),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.pushNamed(context, 'Firebasecard');
                              },
                              icon: Icon(
                                Icons.more_vert_rounded,
                                color: Colors.white,
                                size: 30,
                              ),
                            ),
                            Text("General Doctors",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold)),
                            TextButton(
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: Text("Post your Service"),
                                        content: Container(
                                          height: MediaQuery.of(context)
                                              .size
                                              .shortestSide,
                                          child: Column(
                                            children: [
                                              // TextFormField(
                                              //   autofocus: true,
                                              //   enabled: true,
                                              //   validator: (value) {
                                              //     setState(() {});
                                              //     if (value!.isEmpty) {
                                              //       return "Field can't be empty";
                                              //     }
                                              //   },
                                              //   decoration:
                                              //       const InputDecoration(
                                              //           prefixIcon: Padding(
                                              //             padding: EdgeInsets
                                              //                 .symmetric(
                                              //                     horizontal:
                                              //                         5.0),
                                              //             child: Text("Name: "),
                                              //           ),
                                              //           prefixIconConstraints:
                                              //               BoxConstraints(
                                              //                   minHeight: 0,
                                              //                   minWidth: 0),
                                              //           prefixStyle: TextStyle(
                                              //               color:
                                              //                   Colors.black),
                                              //           hintText: 'Enter name'),
                                              // ),
                                              TextFormField(
                                                validator: (value) {
                                                  setState(() {});
                                                  if (value!.isEmpty) {
                                                    return "Field can't be empty";
                                                  }
                                                },
                                                controller:
                                                    Speacialitycontroller,
                                                decoration:
                                                    const InputDecoration(
                                                        prefixIcon: Padding(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      5.0),
                                                          child: Text(
                                                              "Speaciality: "),
                                                        ),
                                                        prefixIconConstraints:
                                                            BoxConstraints(
                                                                minHeight: 0,
                                                                minWidth: 0),
                                                        hintText:
                                                            'Your Speciality'),
                                              ),
                                              TextFormField(
                                                validator: (value) {
                                                  setState(() {});
                                                  if (value!.isEmpty) {
                                                    return "Field can't be empty";
                                                  }
                                                },
                                                controller: Langcontroller,
                                                decoration:
                                                    const InputDecoration(
                                                        prefixIcon: Padding(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      5.0),
                                                          child: Text(
                                                              "Languages: "),
                                                        ),
                                                        prefixIconConstraints:
                                                            BoxConstraints(
                                                                minHeight: 0,
                                                                minWidth: 0),
                                                        hintText:
                                                            'Hindi, English, etc'),
                                              ),
                                              TextFormField(
                                                validator: (value) {
                                                  setState(() {});
                                                  if (value!.isEmpty) {
                                                    return "Field can't be empty";
                                                  }
                                                },
                                                controller: Expcontroller,
                                                decoration:
                                                    const InputDecoration(
                                                        prefixIcon: Padding(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      5.0),
                                                          child: Text("Exp: "),
                                                        ),
                                                        prefixIconConstraints:
                                                            BoxConstraints(
                                                                minHeight: 0,
                                                                minWidth: 0),
                                                        hintText:
                                                            'Enter number of Exp. (yrs)'),
                                              ),
                                              TextFormField(
                                                validator: (value) {
                                                  setState(() {});
                                                  if (value!.isEmpty) {
                                                    return "Field can't be empty";
                                                  }
                                                },
                                                controller: ratescontroller,
                                                decoration:
                                                    const InputDecoration(
                                                        prefixIcon: Padding(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      5.0),
                                                          child:
                                                              Text("Rates: "),
                                                        ),
                                                        prefixIconConstraints:
                                                            BoxConstraints(
                                                                minHeight: 0,
                                                                minWidth: 0),
                                                        hintText:
                                                            'Enter Fees (/min)'),
                                              ),
                                            ],
                                          ),
                                        ),
                                        actions: [
                                          TextButton(
                                              child: Text("POST"),
                                              onPressed: () async {
                                                setState(() {});
                                                namee = namecontroller.text;
                                                speciality =
                                                    Speacialitycontroller.text;
                                                language = Langcontroller.text;
                                                xp = Expcontroller.text;
                                                rates = ratescontroller.text;
                                                await createuser(
                                                    namee,
                                                    speciality,
                                                    language,
                                                    xp,
                                                    rates);
                                                Navigator.of(context).pop();

                                                setState(() {});
                                              }),
                                        ],
                                      );
                                    });
                              },
                              child: Icon(
                                Icons.add,
                                color: Colors.white,
                                size: 30,
                              ),
                            )
                          ]),
                    ),
                    DefaultTabController(
                      length: 3,
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              color: Colors.indigo[800],
                            ),
                            width: 200,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 10, right: 10, top: 2),
                              child: Container(
                                child: TabBar(
                                  controller: _controller,
                                  indicatorSize: TabBarIndicatorSize.label,
                                  indicatorPadding: EdgeInsets.only(
                                    bottom: 10,
                                    top: 8,
                                  ),
                                  indicator: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.indigo[600],
                                  ),
                                  unselectedLabelColor: Colors.white,
                                  padding: EdgeInsets.zero,
                                  labelPadding: EdgeInsets.zero,
                                  onTap: (refresh),
                                  tabs: [
                                    Tab(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          "Chats",
                                        ),
                                      ),
                                    ),
                                    Tab(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text("Status"),
                                      ),
                                    ),
                                    Tab(
                                        child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text("Calls"),
                                    )),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              if (_controller.index == 0)
                Expanded(
                    child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(80),
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 30, left: 20, right: 40),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "All Chats",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 17),
                              ),
                              Icon(Icons.candlestick_chart_outlined)
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            "Doctors",
                            style: TextStyle(color: Colors.grey),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Chatcard(
                              image: "assets/images/2.png",
                              name: "Prasshant Kumar",
                              customers: "3700",
                              language: "Hindi",
                              XP: "5",
                              rates: "40/min"),
                          SizedBox(height: 15),
                          Chatcard(
                              image: "assets/images/3.png",
                              name: "Adarsh Mishra",
                              customers: "2820",
                              language: "Hindi",
                              rates: "25/min",
                              XP: "20"),
                          SizedBox(height: 15),
                          Chatcard(
                              image: "assets/images/4.png",
                              name: "Sanjeev Gupta",
                              customers: "3470",
                              language: "Hindi",
                              rates: "30/min",
                              XP: "10"),
                          SizedBox(height: 15),
                          Row(
                            children: [
                              Text(
                                "See more",
                                style: TextStyle(
                                    color: Colors.red[400],
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(width: 5),
                              Icon(
                                Icons.arrow_forward_ios_rounded,
                                size: 14,
                                color: Colors.red[400],
                              )
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            "Counsellors",
                            style: TextStyle(color: Colors.grey),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Chatcard(
                              image: "assets/images/1.png",
                              name: "Aman Pandey",
                              customers: "528",
                              language: "Hindi",
                              rates: "9/min",
                              XP: "8"),
                          SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "See more",
                                    style: TextStyle(
                                        color: Colors.red[400],
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(width: 5),
                                  Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    size: 14,
                                    color: Colors.red[400],
                                  )
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                )),
              if (_controller.index == 1)
                Expanded(
                    child: Container(
                  child: Firebasecard(),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(80),
                    ),
                  ),
                )),
              if (_controller.index == 2)
                Expanded(
                    child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(80),
                    ),
                  ),
                ))
            ],
          )
        ],
      ),
    ));
  }

  Future createuser(namee, speciality, language, xp, rates) async {
    final docUser = FirebaseFirestore.instance.collection('Post').add({
      'name': namee,
      'speciality': speciality,
      'language': language,
      'xp': xp,
      'rates': rates,
    });
  }
}
