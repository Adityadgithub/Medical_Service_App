import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebasetut/chatcard.dart';
import 'package:firebasetut/dochomepage.dart';
import 'package:firebasetut/googlesigninwidget.dart';
import 'package:flutter/material.dart';


class Firebasecard extends StatefulWidget {
  const Firebasecard({Key? key}) : super(key: key);
  @override
  State<Firebasecard> createState() => _FirebasecardState();
}

class _FirebasecardState extends State<Firebasecard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('Post').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final services = snapshot.data!.docs;
          List<Widget> servicesWidget = [];
          for (var st in services) {
            final _name = (st.data()! as Map<String, dynamic>)['name'];
            final _xp = (st.data()! as Map<String, dynamic>)['xp'];
            final _rates = (st.data()! as Map<String, dynamic>)['rates'];
            final _language = (st.data()! as Map<String, dynamic>)['language'];

            final datas = buildTile(_name, _xp, _language, _rates, context);
            servicesWidget.add(datas);
          }
          return ListView(
            children: servicesWidget,
            shrinkWrap: true,
          );
        }
        return Center(child: CircularProgressIndicator.adaptive());
      },
    ));
  }

  buildTile(name, xp, _language, _rates, BuildContext context) {
    return Chatcard(
      XP: xp,
      customers: '8544',
      rates: rates,
      language: language,
      name: name,
      image: 'assets/images/2.png',
   
    );
  }
}
