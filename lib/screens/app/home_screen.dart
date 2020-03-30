import 'package:on_tab/screens/app/add_screen.dart';
import 'package:on_tab/screens/app/history_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomeScreen extends StatefulWidget {
  static const String id = 'home_screen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  Future<double> totalCalc() async {
    var url = "http://localhost:8000/api/posts/get/";
    var response = await http.get(url, headers: {
      "auth-token":
          "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI1ZTc3Yzc1ZjYxMGU1ODI3MDBhYTgzOWMiLCJpYXQiOjE1ODQ5ODM4MzN9.4s2AhDUIshWRzShRMOmF-1Jns9FWPsIJv9MQV7qg65I",
    });
    var jsonData = json.decode(response.body);
    double total = 0.00;
    for (var p in jsonData) {
      var price = p["price"].toDouble();
      total = price + total;
    }
    return total;
  }

  @override
  void initState() {
    // TODO: implement initState
    totalCalc();
    super.initState();
  }

  double money = 100.96;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.all(4.0),
          child: IconButton(
              icon: Icon(
                Icons.history,
                color: Colors.black,
                size: 35.0,
              ),
              onPressed: () {
                Navigator.pushNamed(context, HistoryScreen.id);
              }),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: IconButton(
                icon: Icon(
                  Icons.add,
                  color: Colors.black,
                  size: 35.0,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, AddScreen.id);
                }),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(
                "\$${money.toStringAsFixed(2)}",
                style: TextStyle(
                  fontFamily: "SigmarOne",
                  fontSize: 64,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
