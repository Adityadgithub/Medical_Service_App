import 'package:flutter/material.dart';

class Chatcard extends StatefulWidget {
  var image;
  var name;
  
  var rates;
  var customers;
  var language;
  var XP;

  Chatcard({
    this.image,
    this.name,
    
    this.rates,
    this.customers,
    this.language,
    this.XP,
  });

  @override
  State<Chatcard> createState() => __ChatcardState(
        image,
        name,

        rates,
        customers,
        language,
        XP,
      );
}

class __ChatcardState extends State<Chatcard> {
  var image;
  var name;
  
  var rates;
  var customers;
  var language;
  var XP;
  __ChatcardState(
    this.image,
    this.name,
    
    this.rates,
    this.customers,
    this.language,
    this.XP,
  ) {
    image = this.image;

    this.name = name;
    this.rates = rates;
    this.customers = customers;
    this.language = language;
    this.XP = XP;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey, width: 1.5),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Row(
                children: [
                  Column(
                    children: [
                      Container(
                        child: CircleAvatar(
                          radius: 25,
                          backgroundImage: AssetImage(image!),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.black,
                            size: 15,
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.black,
                            size: 15,
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.black,
                            size: 15,
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.black,
                            size: 15,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.person,
                            color: Colors.black,
                            size: 13,
                          ),
                          Text(
                            "${customers} total",
                            style: TextStyle(color: Colors.black, fontSize: 13),
                          )
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("$name",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 15)),
                        SizedBox(height: 5),
                   
                        SizedBox(height: 3),
                        Text(
                          "$language",
                          style: TextStyle(color: Colors.grey),
                        ),
                        SizedBox(height: 3),
                        Text(
                          "Exp: ${XP} Years",
                          style: TextStyle(color: Colors.grey),
                        ),
                        SizedBox(height: 3),
                        Text(
                          "$rates",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ]),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 0),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Colors.indigo, width: 1.5)),
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 8.0, bottom: 8.0, left: 15, right: 15),
                  child: Text(
                    "Chat",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.indigo),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


  
}
