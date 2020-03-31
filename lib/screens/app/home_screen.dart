import 'package:on_tab/screens/app/add_screen.dart';
import 'package:on_tab/screens/app/history_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:on_tab/utils/token.dart' as getToken;

class HomeScreen extends StatefulWidget {
  static const String id = 'home_screen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  double money;

  Future totalCalc() async {


    var url = "http://localhost:8000/tasks";
    var response = await http.get(url, headers: {
      "Authorization": "Bearer ${getToken.token}"
    });


    var jsonData = json.decode(response.body);
    double total = 0.00;
    for (var p in jsonData) {
      var price = p["price"].toDouble();
      total = price + total;
    }

    setState(() {
      money = total;
    });
  }

  @override
  void initState() {
    money = 0.00;
    setState(() {
      totalCalc();
    });

    super.initState();
  }

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
