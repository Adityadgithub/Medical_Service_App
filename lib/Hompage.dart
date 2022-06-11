import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'chatcard.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> with TickerProviderStateMixin {
  late TabController _controller;
  @override
  void initState() {
    super.initState();
    _controller = TabController(
      initialIndex: 0,
      length: 2,
      vsync: this,
    );
  }

  void refresh(int) {
    setState(() {});
  }

  var doclist = [];
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
                            Icon(
                              Icons.more_vert_sharp,
                              color: Colors.white,
                              size: 30,
                            ),
                            Text("General Doctors",
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
                    DefaultTabController(
                      length: 1,
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
                                          "All",
                                        ),
                                      ),
                                    ),
                                    Tab(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text("Chats"),
                                      ),
                                    ),
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

  Future getdoctercard() async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    var data = await FirebaseFirestore.instance.collection('Brandname').get();
    setState(() {
      doclist = List.from(data.docs);
    });
  }
}
